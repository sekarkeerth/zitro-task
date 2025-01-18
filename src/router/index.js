import { createRouter, createWebHistory } from "vue-router";
import Employees from "../views/Employees.vue";
import Holidays from "../views/Holidays.vue";

const routes = [
  { path: "/employees", name: "Employees", component: Employees },
  { path: "/holidays", name: "Holidays", component: Holidays },
  { path: "/", redirect: "/holidays" },
  { path: "/:pathMatch(.*)*", redirect: "/holidays" }  // 404 route
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
