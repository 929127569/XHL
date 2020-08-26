import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MH from './components/MyHeade.vue'
import MF from './components/MyFooter.vue'
import Vant from 'vant'
import 'vant/lib/index.css'
import axios from 'axios'
import { ImagePreview } from 'vant';
import './assets/icon/icon.css'
import './assets/icon/iconfont.js'

Vue.use(ImagePreview);

axios.defaults.baseURL='http://127.0.0.1:3000'
Vue.prototype.axios=axios;

Vue.component("my-heade",MH);
Vue.component("my-footer",MF);

Vue.use(Vant);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
