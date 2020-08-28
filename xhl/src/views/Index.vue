<template>
  <div class="Indexstyle">
    <my-heade></my-heade>
    <!-- 轮播图开始 -->
    <div class="mysweiper">
      <van-swipe class="my-swipe" :autoplay="5000" indicator-color="#e4393c">
        <van-swipe-item v-for="(i,k) of banner" :key="k">
          <img :src="i.img" alt />
        </van-swipe-item>
      </van-swipe>
    </div>
    <!--轮播图结束  -->
    <!-- 导航栏 -->
    <div class="nav">
      <div>
        <router-link to="/product/当季热卖">
          <div style="background:#f56a6f;">
            <img src="../assets/kind.png" alt />
          </div>
          <span>商品分类</span>
        </router-link>
        <a href>
          <div style="background:#fb734c;color:white">热</div>
          <span>卡卷忧选</span>
        </a>
        <a href>
          <div style="background:#9be944;color:white">卷</div>
          <span>当季热卖</span>
        </a>
        <a href="javascript:;" @click="code">
          <div style="background:#4ca9fa">
            <img src="../assets/store.png" alt />
          </div>
          <span>卡卷验证</span>
        </a>
      </div>
    </div>
    <!-- 导航栏结束 -->
    <!-- 二维码 -->
    <div class="code" @click="code">
      <van-row>
        <van-col span="4">
          <img src="../assets/code.png" alt />
        </van-col>
        <van-col span="20">关注“杏花楼商城”微信公众号，获得更好服务体验</van-col>
        <!-- <van-col span="8">span: 8</van-col> -->
      </van-row>
    </div>
    <van-image-preview v-model="show" :images="images" class="codeout">
      <template v-slot:index>关注“杏花楼商城”微信公众号，获得更好服务体验</template>
    </van-image-preview>
    <!-- 二维码结束 -->
    <!-- 热门活动 -->
    <div class="active">
      <van-row>
        <van-col span="3">
          <img src="../assets/biaoqian.png" alt />
        </van-col>
        <van-col span="15">当季热销活动</van-col>
        <van-col span="6" class="activestyle">
          全部
          <van-icon name="arrow" size="16px" color></van-icon>
        </van-col>
        <!-- <van-col span="8">span: 8</van-col> -->
      </van-row>
    </div>
    <!-- 热门活动结束 -->
    <!--  商品 -->
    <div class="pro">
      <div style="margin:0.5rem">
        <!-- 种类开始 -->
        <!-- 分类头 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconlihe" />
              </svg> 
            <span style="color:#dc3731;">
              月饼礼盒
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro1" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
        <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconbinggangaodian" />
              </svg> 
            <span style="color:#ee8a34;">
              散装月饼
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro2" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
        <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconbinggangaodian" />
              </svg> 
            <span style="color:#fedf8d;">
              中点
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro3" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
         <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconbinggangaodian1" />
              </svg> 
            <span style="color:#f56555;">
              西点
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro4" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
          <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconicon-test" />
              </svg> 
            <span style="color:#f04430;">
              熟食卤味方便菜
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro5" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
          <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconicon-test1" />
              </svg> 
            <span style="color:#d91047;">
              腊味生腌制品
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro6" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>
          <!-- 商品展示结束 -->
        <div class="protitle">
          <div>
            <img src="../assets/sugar.png" alt="">
            <span >
              糖果休闲零食
            </span>
          </div>
          <div>
            <a href="javascript:;">更多></a>
          </div>
        </div>
        <!-- 分类头结束 -->
        <!-- 商品展示 -->
        <div class="showpro">
          <van-row gutter="12">
            <van-col span="8" v-for="(item,index) of this.pro7" :key="index">
              <router-link :to="`/details/${item.pid}`">
                <img :src="item.img.split('|')[0]" alt />
                <h1>￥{{item.price}}</h1>
                <h1>{{item.title}}</h1>
              </router-link>
            </van-col>
          </van-row>
        </div>


      </div>
      <!-- 商品展示结束 -->
      
    </div>

    <!-- 脚部 -->
    <my-footer :active="'home'"></my-footer>
  </div>
</template>



<script>
// import myFooter from "../components/MyFooter.vue"
export default {
  data() {
    return {
      banner: [],
      show: false,
      // index: 0,
      images: ["http://m.xhlgfsc.com/imgs/weixinguanzhu.png"],
      prolist: [],
      pro1: [],
      pro2: [],
      pro3:[],
      pro4:[],
      pro5:[],
      pro6:[],
      pro7:[],
    };
  },
  methods: {
    //获取商品
    getpro() {
      this.axios.get("/index/getpro").then((res) => {
        this.prolist = res.data;
        for (let i of this.prolist) {
          if (i.isindex == 1) {
            if (i.fid == 80) {
              this.pro1.push(i);
              // console.log("盒装",this.pro1);
            } else if (i.fid == 70) {
              this.pro2.push(i);
              // console.log("散装",this.pro2);
            }else if(i.fid==40){
               this.pro3.push(i);
            }else if(i.fid==50){
               this.pro4.push(i);
            }else if(i.fid==20){
               this.pro5.push(i);
            }else if(i.fid==10){
               this.pro6.push(i);
            }else if(i.fid==60){
               this.pro7.push(i);
            }

          }
        }
        // console.log(this.prolist);
      });
    },
    //二维码展示
    code() {
      this.show = true;
    },
    // onChange(index) {
    // this.index = index;
    // },
    // code(){
    //    ImagePreview({
    //       iamges:[
    //          'https://img.yzcdn.cn/vant/apple-1.jpg',
    //       ],
    //       closeable:true,
    //    })
    // },
    getbanner() {
      this.axios.get("/index/banner").then((res) => {
        this.banner = res.data;
        console.log(this.banner);
      });
    },
  },
  mounted() {
    this.getbanner();
  },
  created() {
    this.getpro();
  },
  //    components:{
  //     [ImagePreview.Component.name]: ImagePreview.Component,
  //   },
  // components:{
  //   myFooter
  // }
};
</script>

<style  >
.showpro img {
  width: 100%;
}
.showpro h1 {
  font-size: 0.55rem;
  margin: 0;
  font-weight: normal;
  line-height: 1.1rem;
}
.showpro a {
  color: #929292;
  outline: none;
  text-align: left;
}
.protitle div a {
  color: #999;
  outline: none;
  text-decoration: none;
  margin-right: 0.5rem;
}
.protitle div {
  font-size: 14px;
  font-weight: bolder;
  /* line-height: 0.8rem; */
}
.protitle div > span {
  margin-top: 1rem;
  color: #99d64b;
  font-weight: bolder;
  font-size: 14px;
}
.protitle div > img {
  width: 16px;
}
.protitle {
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
  margin: 0.9rem 0.75rem 0.5rem;
}
/* .active .van-row .activestyle i{
   padding-top: 2px;
   
   
} */
.active .van-row .activestyle {
  color: #929292;
  font-size: 13px;
  text-align: right;
}
.active .van-col {
  font-size: 14px;
  font-weight: bolder;
  color: #eb4f38;
  line-height: 2.5rem;
}
.active .van-row div {
  padding-left: 0.2rem;
}
.active {
  padding-bottom: 0.5rem;
  background: #eee;
  /* height: 44px; */
}
.active img {
  padding-top: -5px;
  float: left;
  width: 100%;
}
.codeout .van-image-preview__close-icon--top-right {
  top: 9rem !important;
  right: 3.1rem !important;
}
.codeout .van-image-preview__index {
  top: 10rem !important;
}
.codeout .van-image__error,
.codeout .van-image__img,
.codeout .van-image__loading {
  width: 60% !important;
  height: 60% !important;
  margin: 0 auto !important;
}
/* .codeout .van-image-preview__swipe-item .van-image .van-image__img{
   width: 75% !important;
   height: 75% !important;
   margin: 0 auto !important;
} */
.Indexstyle .van-overlay {
  /* margin: 0 auto; */
  width: 80% !important;
  height: 51% !important;
  top: 8rem !important;
  left: 2.5rem !important;
  border-radius: 5px;
}
.codeout .van-image-preview__overlay {
  background-color: rgba(0, 0, 0, 0.7);
}
.code div img {
  width: 100%;
  max-width: 50px;
  /* padding-top:0.35rem ; */
  /* padding:0.35rem 0px ; */
}
.code .van-col {
  padding: 1px 0;
  font-size: 0.9rem;
  color: #5f646e;
  line-height: 1.55rem;
}
.code .van-row,
.active .van-row {
  text-align: left;
  background: #fff;
}
.code .van-row div:last-child,
.active .van-row div:last-child {
  padding-right: 1.05rem;
}
.code .van-row div {
  padding-left: 14px;
}
.code {
  display: block;
  background: #eee;
  width: 100%;
  padding: 0.5rem 0;
}

.nav a span {
  display: block;
  font-size: 0.55rem;
  position: relative;
  top: 0.35rem;
  color: #929292;
}
.nav > div::after {
  content: "";
  display: block;
  clear: both;
}
.nav a div img {
  width: 80%;
  margin-top: 3px;
}
.nav a div {
  margin-top: 0.5rem;
  width: 24px;
  height: 24px;
  margin: 0 auto;
  border-radius: 50%;
  line-height: 24px;
  font-size: 14px;
  text-align: center;
}
.nav a {
  display: block;
  float: left;
  width: 25%;
  padding: 5px 0;
}
/* .nav>div{
   background: white;
   margin-bottom: 5px;
} */
.nav {
  background: #fff;
  padding-bottom: 3.5px;
}
.mysweiper {
  /* margin-top: 45px; */
  padding-bottom: 15px;
  background-color: #eee;
}

.mysweiper .van-swipe__indicator {
  background-color: #fff;
  opacity: 1;
}
/* .my-swipe .van-swipe-item { */
/* color: #fff; */
/* font-size: 20px; */
/* line-height: 150px; */
/* text-align: center; */
/* background-color: #eee; */
/* padding-bottom: 15px; */
/* } */
/* .van-swipe__indicator{
   background-color: aliceblue !important;
} */
.mysweiper .my-swipe img {
  width: 100%;
  height: 100%;
}
</style>

