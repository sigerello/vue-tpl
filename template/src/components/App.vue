<template lang="pug">
  #app
    navbar
    router-view
    footerbar
</template>

<script lang="coffee">
  import Navbar    from "components/Navbar"
  import Footerbar from "components/Footerbar"

  export default {
    components: {
      Navbar
      Footerbar
    }
  }
</script>

<style lang="scss">
  #app {
    height: 100%;
  }
</style>
