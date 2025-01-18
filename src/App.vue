<template>
  <div id="app" class="container">
    <Header @toggle-sidebar="toggleSidebar" :isSidebarOpen="isSidebarOpen" />
    <div class="main-layout">
      <Sidebar :isOpen="isSidebarOpen" />
      <main class="content">
        <router-view />
      </main>
    </div>
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import Sidebar from "./components/Sidebar.vue";

export default {
  name: "App",
  components: {
    Header,
    Sidebar,
  },
  data() {
    return {
      isSidebarOpen: false, // Initial state of sidebar
    };
  },
  methods: {
    toggleSidebar() {
      console.log("Toggling sidebar, current state:", this.isSidebarOpen);
      this.isSidebarOpen = !this.isSidebarOpen; // Toggle the sidebar state
    },
  },
};
</script>
