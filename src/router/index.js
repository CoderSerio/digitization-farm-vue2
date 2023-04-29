import Vue from 'vue'
import VueRouter from 'vue-router'
import routes from './route';
Vue.use(VueRouter)
export default new VueRouter({
    // mode: "history",
    routes // (缩写) 相当于 routes: routes
})