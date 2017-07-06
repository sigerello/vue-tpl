<template lang="pug">
  .container
    #counter
      h1 Counter
      button.btn.btn-secondary(@click="down") -
      .number \{{ count }}
      button.btn.btn-secondary(@click="up") +
</template>

<script lang="coffee">
  export default {
    data: ->
      count: 0
    methods:
      down: ->
        @count -= 1
      up: ->
        @count += 1
  }
</script>

<style lang="scss">
  #counter {
    button:focus {
      box-shadow: none;
    }
    .number {
      display: inline-block;
      font-size: 2rem;
      width: 4rem;
      text-align: center;
      vertical-align: middle;
    }
  }
</style>
