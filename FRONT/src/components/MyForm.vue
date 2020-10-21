<template>
  <div class="my-form">
    <form class="ui form">
      <div class="fields">
        <div class="four wide field">
          <label>Caratula</label>
          <input
            required
            type="text"
            name="img"
            placeholder="img"
            @change="handleChange"
            :value="form.img"
          />
        </div>
        <div class="four wide field">
          <label>Titulo</label>
          <input
            required
            type="text"
            name="titulo"
            placeholder="titulo"
            @change="handleChange"
            :value="form.titulo"
          />
        </div>
        <div class="four wide field">
          <label>Descripción</label>
          <input
            required
            type="text"
            name="descrip"
            placeholder="descrip"
            @change="handleChange"
            :value="form.descrip"
          />
        </div>
        <div class="four wide field">
          <label>Duración</label>
          <input
            required
            type="text"
            name="duracion"
            placeholder="1:25:45"
            @change="handleChange"
            :value="form.duracion"
          />
        </div>
        <div class="four wide field">
          <label>Estreno</label>
          <input
            required
            type="date"
            name="estreno"
            placeholder="estreno"
            @change="handleChange"
            :value="form.estreno"
          />
        </div>
        <div class="four wide field">
          <label>Trailer</label>
          <input
            required
            type="text"
            name="trailer"
            placeholder="trailer"
            @change="handleChange"
            :value="form.trailer"
          />
        </div>
        <div class="four wide field">
          <label>Categoria</label>
          <select name="cate" id="" required multiple>
          <option :value="form.cate = 1">Acción</option>
          <option :value="form.cate = 2">Superheroes</option>
          <option :value="form.cate = 3">Antiheores</option>
          </select>
        </div>

        <div class="four wide field">
          <button :class="btnClass" @click="onFormSubmit">
            {{ btnName }}
          </button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: "MyForm",
  data() {
    return {
      btnName: "Guardar",
      btnClass: "ui primary button submit-button",
      campoPlaca: "collapse",
      campoTipo: "collapse"
    };
  },
  props: {
    form: {
      type: Object
    }
  },
  methods: {
    handleChange(event) {
      const { name, value } = event.target;
      let form = this.form;
      form[name] = value;
      this.form = form;
    },
    onFormSubmit(event) {
      // prevent form submit
      event.preventDefault();

      // form validation
      if (this.formValidation()) {
        // window.console.log("ready to submit");
        this.$emit("onFormSubmit", this.form);

        // change the button to save
        this.btnName = "Guardar";
        this.btnClass = "ui primary button submit-button";
        this.campoPlaca = "collapse";
        this.campoTipo = "collapse";

        // clear form fields
        this.clearFormFields();
      }
    },
    formValidation() {
      // first name
      if (document.getElementsByName("img")[0].value === "") {
        alert("Ingresa una imagen");
        return false;
      }

      if (document.getElementsByName("titulo")[0].value === "") {
        alert("Ingresa un título");
        return false;
      }

      if (document.getElementsByName("descrip")[0].value === "") {
        alert("Ingresa una descripción");
        return false;
      }

      if (document.getElementsByName("duracion")[0].value === "") {
        alert("Ingresa una duracion");
        return false;
      }
      if (document.getElementsByName("estreno")[0].value === "") {
        alert("Ingresa una fecha de estreno");
        return false;
      }
      if (document.getElementsByName("cate")[0].value === "") {
        alert("Ingresa una categoria");
        return false;
      }

      // email
      /* if (document.getElementsByName("email")[0].value === "") {
        alert("Enter email");
        return false;
      } */

      return true;
    },
    clearFormFields() {
      // clear form data
      this.form.img = "";
      this.form.titulo = "";
      this.form.descrip = "";
      this.form.duracion = "";
      this.form.estreno = "";
      this.form.cate = "";
      /* this.form.email = ""; */
      this.form.isEdit = false;

      // clear form fields
      document.querySelector(".form").reset();
    }
  },
  updated() {
    if (this.form.isEdit) {
      this.btnName = "Actualizar";
      this.btnClass = "ui orange button submit-button";
     
    }
  }
};
</script>

<style scoped></style>
