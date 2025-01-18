<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Holiday /</h1>
    <!-- Integrate HolidayTable Component -->
    <HolidayTable />
  </div>
</template>

<script>
import HolidayTable from "../components/HolidayTable.vue";

export default {
  name: "Holiday",
  components: {
    HolidayTable,
  },
};
</script>