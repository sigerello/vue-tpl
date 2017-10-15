<template lang="pug">
  #counter
    .container
      h1 Counter
      button.btn.btn-outline-secondary(@click="down") -
      .number \{{ count }}
      button.btn.btn-outline-secondary(@click="up") +
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
  @import "variables";
  @import "~bootstrap/scss/mixins/breakpoints";

  #counter {
    @include media-breakpoint-up(md) {
      .container {
        max-width: 720px;
      }
    }

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
