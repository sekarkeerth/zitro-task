<template>
  <aside
    class="sidebar"
    :class="{ collapsed: isOpen }"
    aria-expanded="isOpen">
    <ul class="sidebar-menu">
      <li>
        <router-link to="/employees" aria-label="Go to Employees">
          <i class="fa-solid fa-user-group"></i>
          <span>Employees</span>
        </router-link>
      </li>
      <li>
        <router-link to="/holidays" aria-label="Go to Holidays">
          <i class="fa-solid fa-circle-user"></i>
          <span>Holidays</span>
        </router-link>
      </li>
    </ul>
  </aside>
</template>

<script>
export default {
  name: "Sidebar",
  props: {
    isOpen: {
      type: Boolean,
      default: false,
    },
  },
};
</script>



