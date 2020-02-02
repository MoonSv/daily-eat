import Vue from 'vue'
import Router from 'vue-router'
import Relation from '@/views/Relation'
import Home from '@/views/Home'


Vue.use(Router)
export default new Router({
  routes: [
      {
        path: '/',
        name: 'Home',
        component: Home
      },
    {
      path: '/relation',
      name: 'Relation',
      component: Relation
    }
  ]
})