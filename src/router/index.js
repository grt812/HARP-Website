import { createWebHistory, createRouter } from "vue-router";
import Home from "@/views/Home.vue";
import About from "@/views/About.vue";
import ViewPoint from "@/components/ViewPoint/ViewPoint.vue";
import Projects from "@/views/Projects.vue";
import Products from "@/views/Products.vue";
import Articles from "@/views/Articles.vue";
import Contact from "@/views/Contact.vue";
import Login from "@/views/Login.vue";
import OpenSourceProject from "@/components/Projects/OpenSourceProject/OpenSourceProject.vue";
import ResearchProject from "@/components/Projects/ResearchProject/ResearchProject.vue";
import AASReroute from "@/views/AASReroute.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/about",
    name: "About",
    component: About,
  },
  {
    path: "/viewpoint",
    name: "ViewPoint",
    component: ViewPoint,
  },
  {
    path: "/projects",
    name: "Projects",
    component: Projects,
  },
  {
    path: "/products",
    name: "Products",
    component: Products,
  },
  {
    path: "/articles",
    name: "Articles",
    component: Articles,
  },
  {
    path: "/contact",
    name: "Contact",
    component: Contact,
  },
  {
    path: "/login",
    name: "Login",
    component: Login,
  },
  {
    path: "/open-source-project",
    name: "OpenSourceProject",
    component: OpenSourceProject,
  },
  {
    path: "/research-project",
    name:"ResearchProject",
    component: ResearchProject,
  },
  {
    path: "/AASreroute",
    name:"AASreroute",
    component: AASReroute,
  },
 
];

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
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


export default router;
