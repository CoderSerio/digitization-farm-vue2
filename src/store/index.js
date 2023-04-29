import Vue from 'vue'
import Vuex from 'vuex'
import animal from './animal'

Vue.use(Vuex)
export default new Vuex.Store({
    modules: {
        animal
    }
})