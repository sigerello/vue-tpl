<template lang="pug">
  footer
    .container.text-muted
      .copy &copy; \{{ year }} {{ name }}
</template>

<script lang="coffee">
  export default {
    data: ->
      year: new Date().getFullYear()
  }
</script>
