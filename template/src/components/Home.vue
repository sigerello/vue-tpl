<template lang="pug">
  .container
    #home
      h1 \{{ title }}
      h2 \{{ message }}
      p.lead
        | Lorem ipsum dolor sit amet, consectetur adipisicing elit<br>
        | sed do eiusmod tempor incididunt ut labore et dolore magna aliqua
      .links
        router-link(to="/page1") Page 1
        router-link(to="/page2") Page 2
        router-link(to="/counter") Counter
        router-link(to="/page3") Broken Link
</template>

<script lang="coffee">
  export default {
    data: ->
      title: "{{ name }}"
      message: process.env.MESSAGE
  }
</script>

<style lang="scss">
  #home {
    padding: 3rem 1.5rem;
    text-align: center;

    a {
      margin: 0 1rem;
    }
  }
</style>


