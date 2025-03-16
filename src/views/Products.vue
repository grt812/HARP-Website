<template>
    <div class="Products">
      <Header
        title="Products"
        subtitle="We deliver next-gen AI solutions that drive innovation and unlock new possibilities"
      />
      <div class="project-sections">
        <section>
            <h2>Viewpoint</h2>
            <ul>
            <li>
                A email-based knowledge management system built with AI and no-learning automation
            </li>
            </ul>
            <router-link class="button" to="/viewpoint"
              >See more...</router-link
            >
      </section>
      <section>
            <h2>Excellent</h2>
            <ul>
            <li>
                An algorithm that simplifies the task of transforming poorly formatted or complex spreadsheets into a tree-like table heirarchy, to allow for easy parsing of known formats
            </li>
            </ul>
            <a class="button" href="https://github.com/HARP-research-Inc/Excellent-Production">See more...</a>
      </section>
      <section>
      <h2>AdApt</h2>
        <ul>
          <li>Hyper-personalized Advertising</li>
        </ul>
    </section>
      <section>
        <h2>IntelliFabric</h2>
        <ul>
          <li>
            IntelliFabric has two capabilities: CAD (Generative Product Design) and CAM (Modular, self-expanding manufacturing).
          </li>
          <li>
            CAD is able to use user context and conversation to create design constraints and requirements. From these requirements, CAD can create full, physical product designs.
          </li>
          <li>
            CAM can set up a production line, at home, with a 3D printer and a budget.
          </li>
        </ul>
      </section>
      <section>
        <h2>Xavier-One</h2>
        <ul>
          <li>A non-invasive neural Human-Computer-Interface (HCI)</li>
          <li>Programming with thoughts, designing with just thoughts, communicating with just thoughts</li>
          <li>Orders of magnitude cheaper than existing solutions</li>
        </ul>
      </section>
      <!-- <section>
        <h2>Vox Intuitus</h2>
        <ul>
          <li>Social Network Analytics: Hybrid symbolic-heuristic NLP and Cognitive Modeling</li>
          <li>Interprets each agent’s personalized understanding of language, and motivations via Category Theory</li>
        </ul>
      </section> -->
      
      <!-- <section>
        
      </section> -->
      <!-- <section>
        <h2>HARPGraph 2</h2>
        <ul>
          <li>A fundamentally new approach to ML utilizing GenGraph data structures</li>
        </ul>
      </section>
       <section>
        <h2>DSP-OS 2</h2>
        <ul>
          <li>Contract work for Tech Forward Inc. to make a digital signage product.</li>
        </ul>
      </section> -->
    </div>
  
      <!-- <div class="openSource">
        <div class="openSource-carousel">
          <Carousel :items="ProjectCards" title="Open Source" />
        </div>
      </div>
  
      <div class="research">
        <div class="research-carousel">
          <Carousel :items="ResearchCards" title="Research" />
        </div>
      </div> -->
  
      <StayInTheLoop />
      <Footer />
    </div>
  </template>
  
  <script setup>
  import Header from "@/components/General/Header.vue";
  import StayInTheLoop from "@/components/General/StayInTheLoop.vue";
  import Footer from "@/components/General/Footer.vue";
  import Carousel from "@/components/Projects/Carousel.vue";
  
  const ProjectCards = [
    { id: 1, name: "Vox-Intuitus", link: "#" },
    { id: 2, name: "GenGraph", link: "#" },
    { id: 3, name: "Xavier-One", link: "#" },
    { id: 4, name: "IntelliFabric", link: "#" },
    { id: 5, name: "DSP-OS 2", link: "#" },
    { id: 7, name: "Ad Apt", link: "#" },
  ];
  const ResearchCards = [
    { id: 1, name: "Vox Intuit(2024)", link: "/research-project" },
    { id: 2, name: "Vox Intuit(2024)", link: "/research-project" },
    { id: 3, name: "Vox Intuit(2024)", link: "/research-project" },
    { id: 4, name: "Vox Intuit(2024)", link: "/research-project" },
    { id: 5, name: "Vox Intuit(2024)", link: "/research-project" },
    { id: 6, name: "Vox Intuit(2024)", link: "/research-project" },
  ];
  </script>
  
  <style lang="css" scoped>
  .openSource-carousel {
    margin-top: 5rem;
  }
  .openSource-header,
  .research-header {
    margin-top: 4rem;
    margin-right: 8rem;
    margin-left: 8rem;
    color: white;
  }
  .header-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  *{
    color: white;
  }
  #proj-page-description {
    text-align: center;
    font-weight: bold;
    margin: 10px;
  }
  section {
    color: white;
    padding: 30px;
    margin-bottom: 10px;
    width: 50%;
  }
  .project-sections{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  @media (max-width: 390px) {
    section{
      width: 95%;
    }
  }
  
  @media (max-width: 768px) {
    section{
      width: 75%;
    }
  }

  .button{
    margin: 15px 0;
  }

  h2{
    margin: 10px 0;
  }
  
  </style>
  