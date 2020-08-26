import Vue from 'vue'
import VueRouter from 'vue-router'


import Index from '../views/Index.vue'
import Store from '../views/Store.vue'
import Cart from '../views/Cart.vue'
import Person from '../views/Person.vue'
import Product from '../views/Product.vue' 
import Login from '../views/Login.vue'
import Regsiter from "../views/Regsiter.vue";
// import Details from '../views/Details.vue'
// import { component } from 'vue/types/umd'
// import { component } from 'vue/types/umd'

Vue.use(VueRouter)

  const routes = [
    {
      path:'/regsiter',
      component:Regsiter
    },
    {
      path:'/login',
      component:Login
    },
    {
      path:'/details/:pid',//加参数lid,
      props:true,
      component:()=>import(/* webpackChunkName: "details" */ '../views/Details.vue')
    },
    {
      path:'/product/:kw',
      component:Product,
      props:true
    },
    {
      path:'/person',
      component:Person
    },
    {
      path:'/cart',
      component:Cart
    },
    {
      path:'/store',
      name:'store',
      component:Store

    },
  {
    path: '/',
    name: 'index',
    component: Index
  }
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  routes
})

export default router
