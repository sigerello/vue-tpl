<template lang="pug">
  #page404
    .container
      h1 404
      p Page not found
</template>

<style lang="scss">
  @import "variables";
  @import "~bootstrap/scss/mixins/breakpoints";

  #page404 {
    @include media-breakpoint-up(md) {
      .container {
        max-width: 720px;
      }
    }
  }
</style>
