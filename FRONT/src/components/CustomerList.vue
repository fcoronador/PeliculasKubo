<template>
  <div class="customer-list">
    <div class="data">
      <table class="ui celled table">
        <thead>
          <tr>
            <th style="width: 50px; text-align: center;">#</th>
            <th>Poster</th>
            <th>Titulo</th>
            <th>Genero</th>
            <th>Visto</th>
            <th>Calificación</th>
            <th >Opciones</th>
          </tr>
        </thead>

        <tbody>
          <Customer
            v-for="customer in customers"
            :key="customer.id"
            :customer="customer"
            @onDelete="onDelete"
            @onEdit="onEdit"
          />
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import Customer from "./Customer";

export default {
  name: "CustomerList",
  components: {
    Customer
  },
  props: {
    customers: {
      type: Object
    },
    customer: {
      type: Object
    },
  },
  methods: {
    onDelete(id) {
      // window.console.log("customer list delete " + id);
      this.$emit("onDelete", id);
    },
    onEdit(data) {
      // window.console.log("customer list edit " + data);
      this.$emit("onEdit", data);
    }
  }
};
</script>

<style scoped></style>
