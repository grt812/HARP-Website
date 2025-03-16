<template>
  <div>
    <div class="contact">
      <h1>Contact Us</h1>
      <h2 style="color: white; padding: 50px;">We will be opening a contact form shortly! In the meantime, check out our business contacts and social media below.</h2>
    </div>

    <Footer />
  </div>
</template>

<script setup>
import ContactCard from "@/components/Contact/ContactCard.vue";
import GradientButton from "@/components/Buttons/GradientButton.vue";
import Footer from "@/components/General/Footer.vue";
import singleIcon from "@/assets/HARPResearchLockUps/Icons/SingleIcon.png";
import doubleIcon from "@/assets/HARPResearchLockUps/Icons/doubleIcon.png";
import { ref } from "vue";

const showModal = ref(false);
const showModalB = ref(false);

// Form data
const form = ref({
  name: "",
  email: "",
  message: "",
});

const partnerForm = ref({
  name: "",
  email: "",
  message: "",
});

// Handle form submission
const handleSubmit = () => {
  alert("Form submitted!");
  showModal.value = false;
};

const handlePartnerSubmit = () => {
  alert("Partner form submitted!");
  showModalB.value = false;
};
</script>

<style scoped>
@import "../components/Contact/Contact.css";
</style>
