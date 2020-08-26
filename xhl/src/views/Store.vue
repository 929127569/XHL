<template>
    <div>
        <div v-if="show==1">
            <ul>
                <li @click="showimg">商品详情</li>
                <li @click="showserve">卖家服务</li>
            </ul>
        </div>
        <div v-else-if="show==2">
            <ul>
                <li @click="hide">img页面</li>
            </ul>
        </div>
        <div v-else-if="show==3">
            <ul>
                <li @click="hide">serve页面</li>
            </ul>
        </div>
    </div>
</template>


<script>
export default {
    data(){
        return{
            show:1,
        }
    },
    methods:{
        // hide1(){
        //     this.show=2
        // },
        // hide2(){
        //     this.show=3
        // },
        // hide3(){
        //     this.show=1
        // },
        showimg(){
            this.show=2
        },
        showserve(){
            this.show=3
        },
        hide(){
            this.show=1
        }
    }
}
</script>