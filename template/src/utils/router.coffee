
import Vue from "vue"
import VueRouter from "vue-router"

Vue.use VueRouter

import Home     from "components/Home"
import Page     from "components/Page"
import Counter  from "components/Counter"
import NotFound from "components/NotFound"

export default new VueRouter
  mode: "history"
  linkActiveClass: "active"
  linkExactActiveClass: "exact-active"
  scrollBehavior: (to, from, savedPosition) ->
    p = {}
    if savedPosition
      p = savedPosition
    else if to.hash
      p.selector = to.hash
      # p.offset = y: 56 if to.hash in ["#about", "#designers"]
    else
      p = x: 0, y: 0
    p
  routes: [
    { name: "home",      path: "/",        component: Home }
    { name: "page1",     path: "/page1",   component: Page, props: title: "Page 1" }
    { name: "page2",     path: "/page2",   component: Page, props: title: "Page 2" }
    { name: "counter",   path: "/counter", component: Counter }
    { name: "not-found", path: "*",        component: NotFound }
  ]
