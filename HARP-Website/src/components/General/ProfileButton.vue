<!-- ProfileButton.vue -->
<template>
  <div class="profile-container">
    <!-- Debug output -->
    <span style="display: none;">{{ fullName }}</span>
    
    <button 
      @click="toggleDropdown" 
      class="profile-button"
      :class="{ 'active': showDropdown }"
    >
      <!-- Show profile picture if available, otherwise show default user icon -->
      <img 
        v-if="profilePicture" 
        :src="profilePicture" 
        class="profile-image" 
        alt="Profile"
      />
      <svg 
        v-else 
        xmlns="http://www.w3.org/2000/svg" 
        class="user-icon" 
        viewBox="0 0 24 24" 
        fill="none" 
        stroke="currentColor" 
        stroke-width="2"
      >
        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
        <circle cx="12" cy="7" r="4"></circle>
      </svg>
    </button>
    
    <div v-if="showDropdown" class="dropdown-menu">
      <div class="dropdown-header">
        <img 
          v-if="profilePicture" 
          :src="profilePicture" 
          class="dropdown-profile-image" 
          alt="Profile"
        />
        <div class="user-name">{{ fullName }}</div>
      </div>
      <button @click="signOut" class="sign-out-button">Sign Out</button>
    </div>
  </div>
</template>
  
<script>
import axios from 'axios';

export default {
  name: 'ProfileButton',
  
  props: {
    fullName: {
      type: String,
      required: true
    },
    profilePicture: {
      type: String,
      default: null
    }
  },
  
  data() {
    return {
      showDropdown: false
    }
  },
  
  methods: {
    toggleDropdown() {
      this.showDropdown = !this.showDropdown
    },
    
    async signOut() {
      try {
        // First, try to log out from the server (for OAuth)
        await axios.get('http://localhost:5000/api/logout', {
          withCredentials: true
        });
        console.log('Server logout successful');
      } catch (error) {
        console.error('Error logging out from server:', error);
      } finally {
        // Always clear localStorage (for regular login)
        localStorage.removeItem('user');
        
        // Notify components about logout
        window.dispatchEvent(new Event('userLoggedIn'));
        
        // Redirect to login page
        this.$router.push('/login');
      }
    },

    handleClickOutside(event) {
      if (!this.$el.contains(event.target)) {
        this.showDropdown = false
      }
    }
  },

  mounted() {
    document.addEventListener('click', this.handleClickOutside)
    console.log('ProfileButton mounted with name:', this.fullName); // Debug log
    console.log('Profile picture:', this.profilePicture); // Debug log
  },

  beforeUnmount() {
    document.removeEventListener('click', this.handleClickOutside)
  }
}
</script>
  
<style scoped>
.profile-container {
  position: relative;
}

.profile-button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(90deg, #005bea, #00c6fb);
  border: none;
  cursor: pointer;
  transition: opacity 0.3s;
  overflow: hidden;
}

.profile-button:hover {
  opacity: 0.9;
}

.profile-button.active {
  opacity: 0.8;
}

.profile-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.user-icon {
  width: 24px;
  height: 24px;
  color: white;
}

.dropdown-menu {
  position: absolute;
  top: calc(100% + 8px);
  right: 0;
  background-color: #1c1c1c;
  border-radius: 8px;
  min-width: 200px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  z-index: 1000;
}

.dropdown-header {
  padding: 12px 16px;
  border-bottom: 1px solid #333;
  display: flex;
  align-items: center;
  gap: 12px;
}

.dropdown-profile-image {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  object-fit: cover;
}

.user-name {
  padding: 12px 16px;
  border-bottom: 1px solid #333;
  color: white;
  font-weight: 500;
}

.sign-out-button {
  width: 100%;
  padding: 12px 16px;
  text-align: left;
  background: none;
  border: none;
  color: #ff4444;
  cursor: pointer;
  transition: background-color 0.3s;
}

.sign-out-button:hover {
  background-color: #333;
}
</style>