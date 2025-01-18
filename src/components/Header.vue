<template>
  <header class="header">
    <button
      class="navbar"
      @click="$emit('toggle-sidebar')"
      aria-label="Toggle sidebar">
      <i :class="isSidebarOpen ? 'fa-solid fa-xmark' : 'fa-solid fa-bars'"></i>
    </button>
    <h1>Zitro Assignment</h1>
  </header>
</template>

<script>
export default {
  name: "Header",
  props: {
    isSidebarOpen: {
      type: Boolean,
      default: true,
    },
  },
};
</script>
