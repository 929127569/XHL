<template>
    <div>
        <h1>
            个人中心
        </h1>
        <my-footer :active="'person'"></my-footer>
    </div>
</template>

<script>
import myFooter from '../components/MyFooter.vue'
export default {
    components:{
        myFooter
    }
}
</script>