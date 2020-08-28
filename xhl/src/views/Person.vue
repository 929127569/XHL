<template>
    <div>
        <h1>
            {{this.$store.state.nickname}}
        </h1>
        <button @click="logout">退出</button>
        <my-footer :active="'person'"></my-footer>
    </div>
</template>

<script>
import myFooter from '../components/MyFooter.vue'
export default {
    methods:{
        logout(){
            this.$store.commit('logout_mutations',false);
            // sessionStorage.setItem('isLogin',false);
            localStorage.clear();
            sessionStorage.clear();
            // this.$store.state.car=[];
            this.$router.push('/')
        }
    },
    components:{
        myFooter
    }
}
</script>