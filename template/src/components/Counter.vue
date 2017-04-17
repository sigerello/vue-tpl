<template lang="pug">
  #counter
    button(type="button" @click="down") -
    span \{{ counter }}
    button(type="button" @click="up") +
</template>

<script lang="coffee">
  export default {
    data: ->
      counter: 0
    methods:
      up: -> @counter++
      down: -> @counter--
  }
</script>

<style lang="scss">
  #counter {
    button {
      cursor: pointer;
      margin: 0 10px;
    }
  }
</style>
