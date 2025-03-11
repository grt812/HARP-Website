<script>
import GetStarted from "./GetStarted.vue";
import ProfileButton from "./ProfileButton.vue";
import axios from 'axios';

export default {
  name: 'Nav',
  components: { 
    GetStarted, 
    ProfileButton 
  },

  data() {
    return {
      showProductsDropdown: false,
      isScrolled: false, 
      currentUser: null
    };
  },

  created() {
    // Check auth status when component is created
    this.checkAuthStatus();

    // Check URL parameters for OAuth redirect with userData
    this.checkOAuthRedirect();
  },

  methods: {
    toggleProductsDropdown() {
      this.showProductsDropdown = !this.showProductsDropdown;
    },
    
    handleScroll() {
      this.isScrolled = window.scrollY > 100;
    },
    
    checkOAuthRedirect() {
      const urlParams = new URLSearchParams(window.location.search);
      const userData = urlParams.get('userData');
      
      if (userData) {
        try {
          const user = JSON.parse(decodeURIComponent(userData));
          localStorage.setItem('user', JSON.stringify(user));
          
          // Update current user
          this.currentUser = user;
          
          // Dispatch event to notify components
          window.dispatchEvent(new Event('userLoggedIn'));
          
          // Clean URL
          window.history.replaceState({}, document.title, window.location.pathname);
        } catch (error) {
          console.error('Error parsing user data from redirect:', error);
        }
      }
    },
    
    async checkAuthStatus() {
      // First check localStorage (for regular login)
      try {
        const userData = localStorage.getItem('user');
        if (userData) {
          this.currentUser = JSON.parse(userData);
          console.log('User found in localStorage:', this.currentUser);
          return;
        }
      } catch (error) {
        console.error('Error checking auth status from localStorage:', error);
      }
      
      // If no user in localStorage, check session (for OAuth)
      try {
        const response = await axios.get('http://localhost:5000/api/user', {
          withCredentials: true // Important for cookies/session
        });
        
        if (response.data && response.data.email) {
          // We have a logged-in user via session
          this.currentUser = response.data;
          
          // Store in localStorage for consistency
          localStorage.setItem('user', JSON.stringify(response.data));
          console.log('User found from session:', this.currentUser);
        } else {
          this.currentUser = null;
          console.log('No authenticated user found');
        }
      } catch (error) {
        // 401 error is expected if not authenticated
        if (error.response && error.response.status !== 401) {
          console.error('Error checking session auth status:', error);
        }
        this.currentUser = null;
      }
    }
  },
  
  mounted() {
    // Add scroll event listener when component is mounted
    window.addEventListener('scroll', this.handleScroll);
    // Listen for login event
    window.addEventListener('userLoggedIn', this.checkAuthStatus);
    // Listen for storage changes
    window.addEventListener('storage', this.checkAuthStatus);
  },
  
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll);
    window.removeEventListener('userLoggedIn', this.checkAuthStatus);
    window.removeEventListener('storage', this.checkAuthStatus);
  },
};
</script>

<template>
  <div>
    <nav :class="{'scrolled': isScrolled}">
      <div class="nav-left">
        <router-link class="navLink" to="/">
          <img
            src="../../assets/HARPResearchLockUps/LogoLockups/HARP Logo Shirt Res.svg"
            alt="HARP Logo"
            class="logo"
          />
        </router-link>
        <router-link class="navLink" to="/about">About</router-link>
        <div class="navLink products" @click="toggleProductsDropdown">
          Products
          <div v-if="showProductsDropdown" class="dropdown">
            <router-link class="dropdown-link" to="/viewpoint">ViewPoint</router-link>
          </div>
        </div>
        <router-link class="navLink" to="/projects">Projects</router-link>
        <router-link class="navLink" to="/articles">Articles</router-link>
      </div>
      <div class="nav-right">
        <router-link class="navLink" to="/contact">Contact Us</router-link>
        <template v-if="currentUser && currentUser.full_name">
          <profile-button 
            :initial-full-name="userFullName"
            :initial-profile-picture="userProfilePicture" 
          />
        </template>
        <template v-else>
          <router-link class="navLink" to="/login">
            <get-started></get-started>
          </router-link>
        </template>
      </div>
    </nav>
  </div>
</template>

<style lang="css" scoped>
nav {
  width: 100%;
  position: fixed;
  display: flex;
  justify-content: space-between;
  padding: 1% 5% 0% 5%;
  background-color: transparent;
  z-index: 1000;
  text-decoration: none;
  align-items: center;
  font-size: 1.5em;
  transition: background-color 0.3s ease; /* Smooth transition for background color */
}

nav.scrolled {
  background-color: rgba(0, 0, 0, 0.8);
}

.nav-left,
.nav-right {
  display: flex;
  align-items: center;
  gap: 50px;
}
.navLink {
  text-decoration: none;
  color: rgb(255, 255, 255);
  position: relative;
  cursor: pointer;
}
.logo {
  width: 5em;
  margin: 1em;
}
.dropdown {
  position: absolute;
  top: 100%;
  left: 50%;
  background-color: #222;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  padding: 0;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  opacity: 0;
  transform: translate(-50%, 10px);
  transition: opacity 0.3s ease, transform 0.3s ease;
  font-size: 1em;
  z-index: 1000;
}
.products:hover .dropdown {
  opacity: 1;
  transform: translate(-50%, 0);
}

.dropdown-link {
  color: white;
  text-decoration: none;
  padding: 12px 20px;
  font-size: 1em;
  transition: background-color 0.3s ease, color 0.3s ease;
  border-radius: 4px;
}

.dropdown-link:hover {
  background-color: rgba(16, 71, 190, 0.1);
  color: rgba(16, 71, 190);
}
</style>