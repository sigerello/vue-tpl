<template lang="pug">
  nav#navbar.navbar.fixed-top.navbar-toggleable-sm.navbar-light.bg-faded
    button.navbar-toggler.navbar-toggler-right(type="button" data-toggle="collapse" data-target="#navbar-collapse")
      span.navbar-toggler-icon
        i.fa.fa-bars
    router-link.navbar-brand(:to="'/'" exact)
      img.d-inline-block.align-top(src="~assets/logo.png" width="30" height="30")
      | {{ name }}
    #navbar-collapse.collapse.navbar-collapse
      ul.navbar-nav.ml-auto
        router-link.nav-item(:to="'/page1'" tag="li"): a.nav-link Page 1
        router-link.nav-item(:to="'/page2'" tag="li"): a.nav-link Page 2
        router-link.nav-item(:to="'/counter'" tag="li"): a.nav-link Counter
        router-link.nav-item(:to="'/page3'" tag="li"): a.nav-link Broken Link
</template>

<script lang="coffee">
  export default {
    watch:
      "$route": (to, from) ->
        $("#navbar-collapse").collapse "hide"
  }
</script>

<style lang="scss">
  #navbar {
    .navbar-brand {
      text-transform: uppercase;

      img {
        margin-right: 0.5rem;
        opacity: 0.5;
      }
    }

    .navbar-toggler {
      outline: none !important;
      border: none;

      .navbar-toggler-icon {
        background-image: none;
        width: 1.2rem;
      }

      .fa-bars {
        opacity: 0.7;
        line-height: 2rem;
        font-size: 1.3rem;
      }
    }
  }
</style>
