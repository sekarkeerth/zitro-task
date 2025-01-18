<template>
  <div class="holiday-table">
    <!-- Title -->
    <h1 class="table-title">HOLIDAY TABLE</h1>

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
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(employee, index) in filteredEmployees"
          :key="index"
          :class="{ 'row-hover': hoverIndex === index }"
          @mouseover="hoverRow(index)"
          @mouseleave="hoverRow()"
        >
          <td>{{ employee.name }}</td>
          <td>{{ employee.surname }}</td>
          <td>{{ employee.department }}</td>
          <td class="action-cell">
            <div class="x-pop" style="position: relative;">
              <button @click="toggleDetails(index)" class="view-button">
                <i class="fas fa-eye view-eye"></i>
              </button>
              <!-- Popup for Requested Holidays -->
              <div v-if="activeDetailsIndex === index" class="popup">
                <h2 class="popup-title">REQUESTED HOLIDAYS</h2>
                <ul class="holiday-list">
                  <li
                    v-for="(holiday, idx) in filteredEmployees[index].holidays"
                    :key="idx"
                  >
                    From {{ holiday.start }} to {{ holiday.end }}
                  </li>
                </ul>
                <div class="popup-actions">
                  <button @click="cancelDetails" class="cancel-button">Cancel</button>
                  <button @click="validateDetails" class="validate-button">Validate</button>
                </div>
              </div>
            </div>
          </td>
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
          holidays: [
            { start: "11/02", end: "13/02" },
            { start: "19/02", end: "21/03" },
            { start: "27/02", end: "30/03" },
          ],
        },
        {
          name: "Paul",
          surname: "Cox",
          department: "Accounting",
          holidays: [{ start: "03/04", end: "08/04" }],
        },
        {
          name: "William",
          surname: "Terry",
          department: "Product Analysis",
          holidays: [{ start: "09/04", end: "11/04" }],
        },
        {
          name: "Mark",
          surname: "Spencer",
          department: "Business & Services",
          holidays: [{ start: "12/04", end: "15/04" }],
        },
        {
          name: "Erik",
          surname: "Smith",
          department: "Software Development",
          holidays: [{ start: "15/04", end: "18/04" }],
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
    toggleDetails(index) {
      this.activeDetailsIndex = this.activeDetailsIndex === index ? null : index;
    },
    cancelDetails() {
      this.activeDetailsIndex = null;
    },
    validateDetails() {
      alert("Holiday validated!");
      this.activeDetailsIndex = null;
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