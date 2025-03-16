<template>
  <div class="stay-in-the-loop">
    <div class="image-section">
      <img
        src="../../assets/HARPResearchLockUps/Photos/team.webp"
        alt="team image"
        class="image-placeholder"
      />
    </div>
    <div class="content-section" ref="contentSection">
      <!-- <h1 id="FirstText" :class="firstTextVisible ? 'slide-in-right' : ''">
        Stay in the Loop.
      </h1>
      <span
        id="SecondaryText"
        :class="secondaryTextVisible ? 'slide-in-left' : ''"
      >
        Join our community of 1000+
      </span>
      <div class="subscribe-form">
        <input type="email" placeholder="Enter your email..." />
        <button>Subscribe</button>
      </div> -->
      <h1 id="FirstText" :class="firstTextVisible ? 'slide-in-right' : ''">Stay in the loop and check us out!</h1>
      <div id="SecondaryText"
      :class="secondaryTextVisible ? 'slide-in-left' : ''">
      <div class="flex">
        <a href="#" style="display: inline;"><GithubIcon /></a>
        <a href="#" style="display: inline;"><LinkedInIcon /></a>
      </div>
      </div>
    </div>
  </div>
</template>

<script>

import GithubIcon from "../../assets/SocialMediaIcons/GithubIcon.vue";
import LinkedInIcon from "../../assets/SocialMediaIcons/LinkedInIcon.vue";

export default {
  name: "StayInTheLoop",
  components: {
    GithubIcon,
    LinkedInIcon,
  },
  data() {
    return {
      firstTextVisible: false,
      secondaryTextVisible: false,
    };
  },
  mounted() {
    this.initObserver();
  },
  methods: {
    initObserver() {
      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              // When element is in view, add classes for animation
              this.firstTextVisible = true;
              this.secondaryTextVisible = true;
            }
          });
        },
        {
          threshold: 0.5, // Trigger when 50% of the element is in view
        }
      );

      observer.observe(this.$refs.contentSection);
    },
  },
};
</script>
<style scoped>
@import "./stayintheloop.css";
</style>
