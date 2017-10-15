<template lang="pug">
  nav#navbar.navbar.navbar-expand-md.fixed-top.navbar-light
    router-link.navbar-brand(to="/" exact)
      img.d-inline-block.align-top(src="~assets/logo.png" width="30" height="30")
      | {{ name }}
    button.navbar-toggler(type="button" data-toggle="collapse" data-target="#navbar-menu")
      span.navbar-toggler-icon
        i.fa.fa-bars
    #navbar-menu.collapse.navbar-collapse
      .navbar-nav.ml-auto
        router-link.nav-item.nav-link(to="/page1") Page 1
        router-link.nav-item.nav-link(to="/page2") Page 2
        router-link.nav-item.nav-link(to="/counter") Counter
        router-link.nav-item.nav-link(to="/page3") Broken Link
</template>

<script lang="coffee">
  export default {
    watch:
      "$route": (to, from) ->
        $("#navbar-menu").collapse "hide"
  }
</script>

<style lang="scss">
  @import "variables";
  @import "~bootstrap/scss/mixins/breakpoints";

  #navbar {
    background-color: #f7f7f7;
    opacity: 1;
    transition: all 500ms;
    box-shadow: 0 0 5px rgba(57, 70, 78, 0.5);
    .dropdown-item {
      color: rgba(0, 0, 0, 0.5);
      &:hover { color: rgba(0, 0, 0, 0.7); }
    }

    @include media-breakpoint-up(sm) {
      &.home {
        background-color: $white;
        opacity: 0.8;
        transition: all 500ms;
        box-shadow: 0 0 5px rgba(57, 70, 78, 0.2);
        .navbar-brand, .nav-item, .navbar-toggler i, .dropdown-item {
          color: $link-color;
          &:hover { color: $link-hover-color; }
        }
      }
      &.expanded {
        transition: all 500ms;
        opacity: 1;
      }
    }
    a:not([href]):not([tabindex]) {
      &:hover, &:focus {
        text-decoration: none;
      }
    }
  }

  .navbar-brand {
    text-transform: uppercase;
  }
  .navbar-toggler, .dropdown-item {
    outline: none !important;
    border: none;
  }
  .navbar-toggler .navbar-toggler-icon {
    background-image: none;
    width: 1.2rem;
  }
  .navbar-toggler .fa {
    opacity: 0.8;
    line-height: 2rem;
    font-size: 1.3rem;
  }
</style>
