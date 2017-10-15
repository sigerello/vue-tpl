
import "babel-polyfill"

import "bootstrap/js/src/util"
import "bootstrap/js/src/collapse"
import "bootstrap/js/src/modal"

import Vue    from "vue"
import router from "utils/router"
import App    from "components/App"

new Vue
  el: "#app"
  router: router
  render: (h) -> h(App)
