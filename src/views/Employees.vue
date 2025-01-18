<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Employee Management</h1>
    <!-- Integrate EmployeeTable Component -->
    <EmployeeTable />
  </div>
</template>

<script>
import EmployeeTable from "../components/EmployeeTable.vue";

export default {
  name: "Employee",
  components: {
    EmployeeTable,
  },
};
</script>


