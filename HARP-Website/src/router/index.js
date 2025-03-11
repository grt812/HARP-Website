import { createWebHistory, createRouter } from "vue-router";
import Home from "@/views/Home.vue";
import About from "@/views/About.vue";
import Register from "@/views/Register.vue"
import ViewPoint from "@/components/ViewPoint/ViewPoint.vue";
import Projects from "@/views/Projects.vue";
import Articles from "@/views/Articles.vue";
import ForgotPassword from '@/views/ForgotPassword.vue';
import ResetPassword from '@/views/ResetPassword.vue';
import Contact from "@/views/Contact.vue";
import Login from "@/views/Login.vue";
import Profile from '@/views/ProfilePictureUpload.vue';
import OpenSourceProject from "@/components/Projects/OpenSourceProject/OpenSourceProject.vue";
import ResearchProject from "@/components/Projects/ResearchProject/ResearchProject.vue";
import AASReroute from "@/views/AASReroute.vue";


const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
    meta: { requiresAuth: false }
  },
  {
    path: "/about",
    name: "About",
    component: About,
    meta: { requiresAuth: false }
  },
  {
    path: "/register",
    name: "Register",
    component: Register,
    meta: { requiresAuth: false }
  },
  {
    path: "/viewpoint",
    name: "ViewPoint",
    component: ViewPoint,
    meta: { requiresAuth: false }
  },
  {
    path: "/Projects",
    name: "Projects",
    component: Projects,
    meta: { requiresAuth: false }
  },
  {
    path: "/articles",
    name: "Articles",
    component: Articles,
    meta: { requiresAuth: true }
  },
  {
    path: "/forgot-password",
    name: "ForgotPassword",
    component: ForgotPassword,
    meta: { requiresAuth: false }
  },
  {
    path: "/reset-password/:token",
    name: "ResetPassword",
    component: ResetPassword,
    meta: { requiresAuth: false }
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact,
    meta: { requiresAuth: false }
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
    meta: { requiresAuth: false }
  },
  {
    path: "/profile",
    name: "Profile",
    component: Profile,
    meta: { requiresAuth: false }
  },
  {
    path: "/open-source-project",
    name: "OpenSourceProject",
    component: OpenSourceProject,
    meta: { requiresAuth: false }
  },
  {
    path: "/research-project",
    name: "ResearchProject",
    component: ResearchProject,
    meta: { requiresAuth: false }
  },
  {
    path: "/AASreroute",
    name: "AASreroute",
    component: AASReroute,
    meta: { requiresAuth: false }
  },

];

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { top: 0 };
    }
    return { top: 0 };
  },
});

// Navigation Guard
// router.beforeEach(async (to, from, next) => {
//   // Check if the route requires authentication
//   const requiresAuth = to.matched.some(record => record.meta.requiresAuth);

//   try {
//     // Assuming AuthService is properly imported and initialized
//     const isAuthenticated = await AuthService.isAuthenticated();

//     if (requiresAuth && !isAuthenticated) {
//       // If auth is required but user is not authenticated
//       next('/login');
//     } else if (to.path === '/login' && isAuthenticated) {
//       // If user is authenticated and tries to access login page
//       next('/');  // or wherever you want to redirect authenticated users
//     } else {
//       // For all other cases, including routes with requiresAuth: false
//       next();
//     }
//   } catch (error) {
//     console.error('Authentication check failed:', error);
//     // In case of auth check failure, allow access to public routes
//     if (!requiresAuth) {
//       next();
//     } else {
//       next('/login');
//     }
//   }
// });

export default router;
