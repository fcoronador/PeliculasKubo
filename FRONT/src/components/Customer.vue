<template>
  <tr>
    <td>{{ customer.idpelicula }}</td>
    <td><img :src="customer.img" alt="" srcset="" /> </td>
    <td>{{ customer.titulo }}</td>
    <td>
      <div
        v-for="categoria in customer.cate"
        :key="categoria"
        :categoria="categoria"
      >
        {{ categoria }}
      </div>
    </td>
    <td>
      <i :class="theme" class="fa" aria-hidden="true" @click="ControlVisto"></i>
    </td>
    <td>
      <form>
        <p class="clasificacion">
          <input :id="customer.titulo+'radio1'" type="radio" name="estrellas" value="5" />
          <label :for="customer.titulo+'radio1'">★</label>
          <input :id="customer.titulo+'radio2'" type="radio" name="estrellas" value="4" />
          <label :for="customer.titulo+'radio2'">★</label>
          <input :id="customer.titulo+'radio3'" type="radio" name="estrellas" value="3" />
          <label :for="customer.titulo+'radio3'">★</label>
          <input :id="customer.titulo+'radio4'" type="radio" name="estrellas" value="2" />
          <label :for="customer.titulo+'radio4'">★</label>
          <input :id="customer.titulo+'radio5'" type="radio" name="estrellas" value="1" />
          <label :for="customer.titulo+'radio5'">★</label>
        </p>
      </form>
    </td>
    <td>
      <!-- <button class="mini ui blue button" @click="onEdit">Editar</button>
      <button class="mini ui red button" @click="onDelete">Borrar</button> -->
    </td>
  </tr>
</template>

<script>
export default {
  name: "Customer",
  data() {
    return {
      theme: "fa-eye-slash"
    };
  },
  props: {
    customer: {
      type: Object
    }
  },
  methods: {
    onDelete() {
      // window.console.log("customer delete " + this.customer.id);
      this.$emit("onDelete", this.customer.id);
    },
    onEdit() {
      // window.console.log("customer edit " + this.customer.id);
      this.$emit("onEdit", this.customer);
    },
    ControlVisto() {
      this.theme = "fa-eye";
    }
  }
};
</script>

<style scoped></style>
