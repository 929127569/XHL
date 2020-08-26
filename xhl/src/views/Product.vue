<template>
  <div>
    <my-heade></my-heade>
    <!-- 导航栏 -->
    <div class="pronav">
      <van-tabs v-model="active">
        <van-tab title="综合">
          <!-- 商品 -->
          <div class="probox">
            <div class="probox-item" v-for="(item,index) of products" :key="index">
              <!-- <a href="javascript:;"> -->
              <router-link :to="`/details/`+item.pid">
                <div>
                  <img :src="item.img.split('|')[0]" alt />
                </div>
                <div>
                  <div>{{item.title}}</div>
                  <div style="color:#e4393c">￥{{item.price}}</div>
                  <div style="color:#e4393c">￥{{item.price}}</div>
                  <div>已销售:{{item.sales}}笔</div>
                </div>
              </router-link>  
              <!-- </a> -->
              <van-button type="danger">加入购物车</van-button>
            </div>
            
          </div>
          <!-- 商品结束 -->
        </van-tab>
        <van-tab title="销量">内容 2</van-tab>
        <van-tab title="价格">内容 3</van-tab>
      </van-tabs>
    </div>
    <!-- 导航栏结束 -->
    <!-- 侧边栏 -->
    <div class="prosidebar">
      <van-sidebar v-model="activeKey" @change="onChange">
        <van-sidebar-item title="当季热卖" />
        <van-sidebar-item title="礼券精选" />
        <van-sidebar-item title="年货好礼" />
        <van-sidebar-item title="腊味生腌制品" />
        <van-sidebar-item title="熟食卤味方便菜" />
        <van-sidebar-item title="中点" />
        <van-sidebar-item title="西点" />
        <van-sidebar-item title="糖果休闲零食" />
        <van-sidebar-item title="散装月饼" />
        <van-sidebar-item title="年菜半成品" />
        <van-sidebar-item title="青团" />
        <van-sidebar-item title="盒装月饼" />
        <van-sidebar-item title="端午粽香" />
        <van-sidebar-item title="速食冷冻" />
        <van-sidebar-item title="其他" />
      </van-sidebar>
    </div>
    <!-- 侧边栏结束 -->
    <my-footer></my-footer>
  </div>
</template>

<script>
export default {
  props:['kw'],
  data() {
    return {
      activeKey: 0,
      active: 0,
      products:[],
      // kw:''
    };
  },
  methods:{
    onChange(index){
      let k=index
      let kind=['当季热卖','礼券精选','年货好礼','腊味生腌制品','熟食卤味方便菜','中点','西点','糖果休闲零食','散装月饼','年菜半成品','青团','盒装月饼','端午粽香','速食冷冻','其他']
      this.$router.push("/product/"+kind[k]);
      // console.log(index);
    },
    getproduct(){
            this.axios.get('/pro/productlist?kw='+this.kw).then(res=>{
                // console.log(res.data.pagecount);
                console.log(res.data.results);
                // this.pagecount=res.data.pagecount;
                this.products=res.data.results;
                
            })
        },
  },
  created(){
    this.kw=this.$route.params.kw;
    this.getproduct()
  },
  watch:{
    $route(){this.kw=this.$route.params.kw},
    kw(){this.getproduct()},
  }
  
};
</script>

<style  >
.prosidebar::-webkit-scrollbar-thumb{
    background-color: transparent;
    border-radius: 6px;
}
.prosidebar::-webkit-scrollbar{
    width: 6px;
    /* height: 6px; */
    background-color: transparent;
}
.probox-item button{
  height: 27px;
  width: 100%;
}
.probox-item a>div>div{
  /* padding-bottom:0.15rem ; */
  height: 25%;
}
.probox-item a>div:first-child{
  padding: 0.62rem;
  width: 30%;
}
/* @media (min-width:319px) {
  .probox-item a>div{padding-right:0rem;}
} */
.probox-item a>div:last-child{
  /* height: 100%; */
  margin: 0.62rem 0rem ;
  padding-right:1.0rem ;
  
  width: 57.5%;
  font-weight: 500;
  font-size: 12px;
}
.probox-item{
  max-height: 152px;
  margin-top:1rem ;
  margin-right: 0.65rem;
  width: 64%;
  right: 0;
  background: #fff;
}
.probox {
  display: flex;
  /* justify-content: flex-start; */
  align-items: flex-end;
  flex-flow: column nowrap;

  /* width: 60%; */
  /* border: 1px solid yellow; */
}
.probox a {
  box-sizing: border-box;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  outline: none;
  text-decoration: none;
  color: #999;
  text-align: left;
  font-size: 13px;
}
.probox img {
  width: 100%;
  min-width: 72px;
  max-width: 92px;
}
.pronav .van-tabs__content {
  background-color: #efeff4;
  height: 100%;
  min-height: 720px;
}
.pronav {
  width: 100%;
  /* margin-top: 2.85rem; */
  /* border: 1px solid red; */
  position: absolute;
  z-index: 1;
  right: 0;
}
.prosidebar .van-sidebar-item--select::before {
  width: 2.5px;
  height: 44px;
}
.prosidebar .van-sidebar-item--select {
  background-color: #efeff4 !important;
}

.prosidebar .van-sidebar-item {
  background-color: #fff;
  height: 2.8rem;
  padding: 0rem 0.5rem;
  line-height: 2.7rem;
  /* line-height: ; */
}
.prosidebar .van-sidebar {
  width: 100%;
  /* overflow: scroll; */

}

.prosidebar {
  width: 30%;
  position: absolute;
  margin-top: 2.85rem;
  z-index: 2;
}
</style>