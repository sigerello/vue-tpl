<template lang="pug">
  #app
    img(src="../assets/logo.png")
    h1 \{{ msg }}
    counter
</template>

<script lang="coffee">
  import Counter from "./Counter.vue"

  export default {
    components:
      Counter: Counter
    data: ->
      msg: "{{ name }}"
  }
</script>

<style lang="scss">
  #app {
    text-align: center;
    h1 {
      font-weight: normal;
    }
  }
</style>
