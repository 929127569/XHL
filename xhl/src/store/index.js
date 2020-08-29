import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin:sessionStorage.getItem('isLogin')||false,
    nickname:sessionStorage.getItem('nickname')||"",
    car:JSON.parse('[]'||localStorage.getItem('car')),
    // car:[]
  },
  mutations: {
    login_mutations(state,payload){
      state.isLogin=true;
      state.nickname=payload.nickname;
    },
    logout_mutations:(state)=>{
      state.isLogin=false;
      state.car=[];
      state.nickname="";
      sessionStorage.clear();
      localStorage.clear();
    },
    addTocar(state,goodsInfo){
      state.car.push(goodsInfo);
      localStorage.setItem('car',JSON.stringify(state.car));
    }
  },
  actions: {
  },
  modules: {
  },
  getters:{
    getAllCount(state){
      let count=0;
      for(let i of state.car){
        count+=i.count;
      }
      return count;
    }
  }
})
