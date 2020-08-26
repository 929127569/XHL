<template>
    <div id="header">
        <div>
            <router-link to="/">
                <van-icon name="arrow-left"  class="arrow"/> 
            </router-link>
            <input type="text" placeholder="输入关键词"  class="search" @blur="search" v-model="kw">
            <span @click="search">搜索</span>
        </div>
    </div>
</template>


<script>
export default {
    data(){
        return{
            kw:''
        }
    },
    methods:{
        search(){
            clearTimeout(this.timer);
            this.timer=setTimeout(()=>{
                if(this.kw.trim()!==""){
                    this.$router.push("/product/"+this.kw);
                }
            },1000)
        }
    },
    wathc:{
        $route(){
            this.kw=this.$route.params.kw
        }
    },
    mounted(){
    }
}
</script>

<style >
/* #header .van-nav-bar{width: 100%;z-index: 10 !important;}
  .van-nav-bar__left{padding-left: 12px !important;width: 100% !important;}
  .van-search{
      padding: 0 !important;
      padding-left:20px !important;
      width: 100% !important;
      min-width: 200px !important;
      padding-right: 20px !important;
      margin-right: 50px !important;
    }
  .van-search .van-cell{
      padding-top: 0 !important;
      padding-bottom: 0 !important;
      height: 30px !important;
      width: 100% !important;
    }
  .van-field__control{line-height: 30px !important;}
  .van-icon-search{line-height: 32px !important;}
  .van-nav-bar__right{
      padding-right: 15px !important;
      padding-left: 5px !important;
      width: auto !important;
      height: auto !important;
    }
.van-search__content{
    background-color: #f1f1f1 !important;
}
.arrow{
    color: #666 !important;
} */
</style>
<style>
#header a{text-decoration: none;outline: none;color: #666;}
#header input{
    width: 60%;
    height: 1.8rem;
    border: none;
    outline: none;
    background-color: #f1f1f1;
    padding: 0 0.5rem;
    border-radius: 5px;
    font-size: 14px;
    
}
#header div{
    display: flex;
    justify-content: space-around;
    align-items: center;
    /* height: 45px; */
    position: fixed;
    z-index: 999;
    top: 0;
    width: 100%;
    background-color:#fff ;
    font-size: 14px;
    padding: 8px 10px 8px 0px;

}
#header {
    height: 2.8rem;
    background: #ffffff;
}
</style>