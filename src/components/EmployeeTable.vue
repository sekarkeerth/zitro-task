<template>
  <div class="holiday-table">
    <!-- Title -->
    <h1 class="table-title">EMPLOYEE LIST</h1>

    <!-- Search Fields -->
    <div class="search-container">
      <input
        v-model="searchName"
        @input="filterTable"
        type="text"
        placeholder="Search for name"
        class="search-input"
      />
      <input
        v-model="searchDepartment"
        @input="filterTable"
        type="text"
        placeholder="Search for Department"
        class="search-input"
      />
    </div>

    <!-- Data Table -->
    <table class="data-table" v-if="filteredEmployees.length > 0">
      <thead>
        <tr>
          <th>Name</th>
          <th>Surname</th>
          <th>Department</th>
          <th>Age</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(employee, index) in filteredEmployees"
          :key="index"
          :class="{ 'row-hover': hoverIndex === index }"
          @mouseover="hoverRow(index)"
          @mouseleave="hoverRow()">
          <td>{{ employee.name }}</td>
          <td>{{ employee.surname }}</td>
          <td>{{ employee.department }}</td>
          <td>{{ employee.age }}</td>
        </tr>
      </tbody>
    </table>

    <!-- No Records Found Message -->
    <div v-else class="no-records">
      No records found
    </div>
  </div>
</template>

<script>
export default {
  name: "HolidayTable",
  data() {
    return {
      searchName: "",
      searchDepartment: "",
      hoverIndex: null,
      activeDetailsIndex: null,
      employees: [
        {
          name: "Erik",
          surname: "Smith",
          department: "Accounting",
          age: 27,
        },
        {
          name: "Paul",
          surname: "Cox",
          department: "Accounting",
          age: 28,
        },
        {
          name: "William",
          surname: "Terry",
          department: "Product Analysis",
          age: 29,
        },
        {
          name: "Mark",
          surname: "Spencer",
          department: "Business & Services",
          age: 30,
        },
        {
          name: "Erik",
          surname: "Smith",
          department: "Software Development",
          age: 31,
        },
      ],
      filteredEmployees: [],
    };
  },
  methods: {
    filterTable() {
      const nameFilter = this.searchName.toLowerCase();
      const departmentFilter = this.searchDepartment.toLowerCase();
      this.filteredEmployees = this.employees.filter((employee) =>
        employee.name.toLowerCase().includes(nameFilter) &&
        employee.department.toLowerCase().includes(departmentFilter)
      );
    },
    hoverRow(index) {
      this.hoverIndex = index;
    },
  },
  created() {
    this.filteredEmployees = this.employees;
  },
};
</script>
