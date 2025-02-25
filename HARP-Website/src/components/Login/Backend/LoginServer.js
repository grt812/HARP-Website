import express from 'express';
import cors from 'cors';
import passport from 'passport';
import session from 'express-session';
import { Strategy as GoogleStrategy } from 'passport-google-oauth20';
import bcrypt from 'bcrypt';
import pg from 'pg';
import 'dotenv/config';

const app = express();
const port = 5000;
const { Pool } = pg;

// Middleware
app.use(cors({
    origin: process.env.FRONTEND_URL || 'http://localhost:5173',
    credentials: true
}));
app.use(express.json());

// Session configuration
app.use(session({
    secret: process.env.SESSION_SECRET || 'your-secret-key',
    resave: false,
    saveUninitialized: false,
    cookie: {
        secure: process.env.NODE_ENV === 'production',
        httpOnly: true,
        maxAge: 24 * 60 * 60 * 1000
    }
}));

app.use(passport.initialize());
app.use(passport.session());

// Database configuration
const pool = new Pool({
    connectionString: process.env.API_URL,
    ssl: {
        rejectUnauthorized: false
    }
});

// Initialize database
const initializeDatabase = async () => {
    try {
        const createTableQuery = `
            CREATE TABLE IF NOT EXISTS "public"."Login" (
                email TEXT PRIMARY KEY,
                password TEXT,
                full_name TEXT,
                created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                last_login TIMESTAMP WITH TIME ZONE,
                is_active BOOLEAN DEFAULT true,
                reset_token TEXT,
                reset_token_expiry TIMESTAMP WITH TIME ZONE,
                google_id TEXT
            );
        `;
        await pool.query(createTableQuery);
        console.log('Database initialized successfully');
    } catch (error) {
        console.error('Error initializing database:', error);
    }
};

initializeDatabase();

// Passport serialization
passport.serializeUser((user, done) => {
    done(null, user.email);
});

passport.deserializeUser(async (email, done) => {
    try {
        const { rows } = await pool.query('SELECT * FROM "Login" WHERE email = $1', [email]);
        done(null, rows[0]);
    } catch (error) {
        done(error);
    }
});

// Google OAuth Strategy
passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: process.env.GOOGLE_CALLBACK_URL || "http://localhost:5000/auth/google/callback"
},
    async (accessToken, refreshToken, profile, done) => {
        try {
            const { rows } = await pool.query(
                'SELECT * FROM "Login" WHERE email = $1 OR google_id = $2',
                [profile.emails[0].value, profile.id]
            );

            if (rows.length) {
                // Update existing user
                await pool.query(
                    'UPDATE "Login" SET last_login = CURRENT_TIMESTAMP, google_id = $1, is_active = true WHERE email = $2',
                    [profile.id, profile.emails[0].value]
                );
                return done(null, rows[0]);
            }

            // Create new user
            const newUser = await pool.query(
                'INSERT INTO "Login" (email, full_name, google_id, is_active) VALUES ($1, $2, $3, true) RETURNING *',
                [profile.emails[0].value, profile.displayName, profile.id]
            );

            return done(null, newUser.rows[0]);
        } catch (error) {
            return done(error);
        }
    }
));

// Import traditional login routes
import loginRoutes from './LoginAPI.js';
app.use('/', loginRoutes(pool));

// OAuth routes
app.get('/auth/google',
    passport.authenticate('google', { 
        scope: ['profile', 'email'],
        prompt: 'select_account'
    })
);

app.get('/auth/google/callback', 
    passport.authenticate('google', { 
        failureRedirect: process.env.FRONTEND_URL + '/login' || 'http://localhost:5173/login',
        failureFlash: true 
    }),
    (req, res) => {
        res.redirect(process.env.FRONTEND_URL || 'http://localhost:5173/');
    }
);

// Protected route example
app.get('/api/user', (req, res) => {
    if (!req.isAuthenticated()) {
        return res.status(401).json({ error: 'Not authenticated' });
    }
    res.json(req.user);
});

// Logout route
app.get('/api/logout', (req, res) => {
    req.logout(() => {
        res.redirect(process.env.FRONTEND_URL || 'http://localhost:8080/');
    });
});

app.listen(port, () => {
    console.log(`Authentication server running on port ${port}`);
});

export default app;