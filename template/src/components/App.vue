<template lang="pug">
  #app
    navbar
    router-view
    footerbar
</template>

<script lang="coffee">
  import Navbar from "components/Navbar"
  import Footer from "components/Footer"

  export default {
    components:
      navbar: Navbar
      footerbar: Footer
  }
</script>

<style lang="scss">
  #app {
    height: 100%;
  }
</style>
