// ProfilePictureAPI.js
import express from 'express';
import multer from 'multer';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const router = express.Router();
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Create uploads directory if it doesn't exist
const uploadsDir = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadsDir)) {
    fs.mkdirSync(uploadsDir, { recursive: true });
}

// Configure multer for file uploads
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, uploadsDir);
    },
    filename: function (req, file, cb) {
        // Create unique filename with original extension
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const ext = path.extname(file.originalname);
        cb(null, 'profile-' + uniqueSuffix + ext);
    }
});

// File filter to only allow image files
const fileFilter = (req, file, cb) => {
    const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (allowedTypes.includes(file.mimetype)) {
        cb(null, true);
    } else {
        cb(new Error('Only .jpeg, .png and .gif files are allowed!'), false);
    }
};

const upload = multer({ 
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 2 // 2MB limit
    },
    fileFilter: fileFilter
});

export default (pool) => {
    // Serve static files from the uploads directory
    router.use('/uploads', express.static(uploadsDir));
    
    // Upload profile picture endpoint
   // Upload profile picture endpoint
router.post('/upload-profile-picture', upload.single('profilePicture'), async (req, res) => {
    if (!req.isAuthenticated()) {
        return res.status(401).json({ error: 'Not authenticated' });
    }
    
    if (!req.file) {
        return res.status(400).json({ error: 'No file uploaded' });
    }
    
    try {
        // Create URL for the uploaded file
        const fileUrl = `/api/uploads/${req.file.filename}`;
        
        console.log('Attempting to update profile picture for user:', req.user.email);
        console.log('File URL:', fileUrl);
        
        // Check if the column exists first
        const checkColumn = await pool.query(`
            SELECT column_name 
            FROM information_schema.columns 
            WHERE table_name = 'Login' AND column_name = 'profile_picture'
        `);
        
        console.log('Column check result:', checkColumn.rows);
        
        // Update user's profile picture in the database
        await pool.query(
            'UPDATE "Login" SET profile_picture = $1 WHERE email = $2',
            [fileUrl, req.user.email]
        );
        
        console.log('Profile picture updated successfully in database');
        
        res.json({
            message: 'Profile picture uploaded successfully',
            profilePicture: fileUrl
        });
    } catch (error) {
        console.error('Profile picture upload error:', error);
        // More detailed error logging
        if (error.position) {
            console.error(`SQL error at position ${error.position}`);
        }
        res.status(500).json({
            error: 'Failed to update profile picture',
            details: error.message
        });
    }
});
    
    // Update the user endpoint to include profile picture
    router.get('/user', (req, res) => {
        if (req.isAuthenticated()) {
            res.json({
                email: req.user.email,
                full_name: req.user.full_name,
                profile_picture: req.user.profile_picture
            });
        } else {
            res.status(401).json({ error: 'Not authenticated' });
        }
    });
    
    return router;
};