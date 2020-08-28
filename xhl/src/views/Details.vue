<template>
  <div>
    <div v-if="show==1">
      <div class="detailshead">
        <a href="javascript:history.go(-1)">
          <van-icon name="arrow-left" />
        </a>
        <router-link to="/">
          <van-icon name="wap-home-o" />
        </router-link>
      </div>
      <div class="detailswipe">
        <van-swipe class="my-swipe" :autoplay="5000" indicator-color="#e4393c">
          <van-swipe-item v-for="(i,k) of swipeimg" :key="k">
            <img :src="i" alt />
          </van-swipe-item>
        </van-swipe>
      </div>
      <div class="goodsinfo">
        <ul>
          <li>
            <div>{{goods.title}}</div>
            <div>已售{{goods.sales}}</div>
          </li>
          <li>
            <div>
              <span class="pricestyle">
                ￥
                <b>{{goods.price}}</b>现售价
              </span>
              <span>门市价&nbsp;￥{{goods.price}}</span>
            </div>
          </li>
          <li class="count">
            数量
            <van-stepper v-model="value" />
          </li>
          <li>
            <div>
              <span class="stockstyle">库&nbsp;&nbsp; 存&nbsp;{{goods.stock}}</span>
              <span>已售出&nbsp;{{goods.sales}}</span>
            </div>
          </li>
          <li>
            <div>
              <span class="stockstyle">
                <svg class="icon" aria-hidden="true">
                  <use xlink:href="#iconxuanze" />
                </svg> 正品保障
              </span>
              <span>
                <svg class="icon" aria-hidden="true">
                  <use xlink:href="#iconxuanze" />
                </svg>
                可门店提货
              </span>
            </div>
          </li>
        </ul>
      </div>
      <div class="goodsdetails">
        <ul>
          <li >
            <a href="javascript:;" @click="showimg">
              <span>商品详情</span>
              <van-icon name="arrow" />
            </a>
          </li>
          <li >
            <a href="javascript:;" @click="showserve">
              <span>售后保证</span>
              <van-icon name="arrow" />
            </a>
          </li>
        </ul>
      </div>
      
      <!-- 购物车底部 -->
      <div class="mycart">
        <van-goods-action>
          <van-goods-action-icon icon="cart-o" text="购物车" @click="tocar"/>
          <van-goods-action-button type="danger" text="立即购买"  @click="buybow"/>
          <van-goods-action-button type="warning" text="加入购物车" @click="addcar"/>
        </van-goods-action>
      </div>
    </div>
    <!-- 内联页-商品详情图片 -->
    <div v-else-if="show==2" class="details-img">
      <div class="imghead">
        <van-icon name="arrow-left" color="#0894ec" @click="hide"/>
        <h3>商品详情</h3>
      </div>
      <div >
        <p v-for="(item,index) of dimg" :key="index">
          <img :src="item" alt="">
        </p>
      </div>
    </div>
    <!-- 内联页--卖家服务 -->
    <div v-else-if="show==3" class="details-serve">
      <div class="servehead">
        <van-icon name="arrow-left" color="#0894ec" @click="hide"/>
        <h3>售后保障</h3>
      </div>
      <div class="servebox">
        <ul>
          <li >
            <div></div>
            <h3>本商品不支持7天无理由退货</h3>
            <p>此类商品属于特殊商品，收货时请仔细验货，如遇非质量问题签收后恕不接受退货，请见谅！如有任何疑问，请联系本商城客服咨询。</p>
          </li>
          <li>
            <div></div>
            <h3>服务承诺</h3>
            <p>网站所售产品均为杏花楼原厂出品，如有任何问题可与我们客服人员联系，我们会在第一时间跟您沟通处理。我们将争取以更具竞争力的价格、更优质的服务来满足您最大的需求。开箱验货：签收时在付款后与配送人员当面核对：商品及配件、应付金额、商品数量及发货清单、发票（如有）、赠品（如有）等；如存在包装破损、商品错误、商品短缺、商品存在质量问题等影响签收的因素，请您可以拒收全部或部分商品，相关的赠品，配件或捆绑商品应一起当场拒收；为了保护您的权益，建议您尽量不要委托他人代为签收；如由他人代为签收商品而没有在配送人员在场的情况下验货，则视为您所订购商品的包装无任何问题。</p>
          </li>
          <li>
            <div></div>
            <h3>温馨提示</h3>
            <p>由于部分商品包装更换较为频繁，因此您收到的货品有可能与图片不完全一致，请您以收到的商品实物为准，同时我们会尽量做到及时更新，由此给您带来不便多多谅解，谢谢！</p>
          </li>
        </ul>
      </div>
    </div>
    <!-- 售后结束 -->

  </div>
</template>

<script>
export default {
  props: ["pid"],
  data() {
    return {
      goods: "",
      swipeimg: [],
      show:1,
      dimg:[],
      value:1,
      count:1,
      title:'',
      price:'',
      img:''
    };
  },
  methods: {
    addcar(){
      let goodsInfo={
        pid:this.pid,
        count:this.value,
        title:this.title,
        price:this.price,
        img:this.img
      }
      if(this.$store.state.car.length==0){
        this.$store.commit('addTocar',goodsInfo);
        // console.log('第一次添加',this.$store.state.car)
      }else{
        let bool=this.$store.state.car.some(item=>{
          return item.pid==goodsInfo.pid;
        })
        // console.log(bool);
        if(bool){
          for(let i of this.$store.state.car){
            // console.log('wo',i);
            if(i.pid==goodsInfo.pid){
              i.count+=goodsInfo.count;
              localStorage.setItem('car',JSON.stringify(this.$store.state.car))
              // console.log('改变数量',this.$store.state.car);
              }
            }
        }else{
          this.$store.commit('addTocar',goodsInfo);
          // console.log('添加新商品',this.$store.state.car);
        }
        

      }
    },
    buybow(){
      let goodsInfo={
        pid:this.pid,
        count:this.count,
        title:this.title,
        price:this.price,
        img:this.img
      };
      if(this.$store.state.car.length==0){
        this.$store.commit('addTocar',goodsInfo);
        this.$router.push('/cart')
      }else{
        let bool=this.$store.state.car.some(item=>{
          return item.pid==goodsInfo.pid;
        })
        if(bool){
          for(let i of this.$store.state.car){
            // console.log('wo',i);
            if(i.pid==goodsInfo.pid){
              i.count++;
              localStorage.setItem('car',JSON.stringify(this.$store.state.car))
              this.$router.push('/cart');
              // console.log('改变数量',this.$store.state.car);
            }
          }
        }else{
          this.$store.commit('addTocar',goodsInfo);
          this.$router.push('/cart');
          // console.log('添加新商品',this.$store.state.car);
        }

      }


    },
    tocar(){
      this.$router.push('/cart')
    },
    showimg(){
      this.show=2
    },
    showserve(){
      this.show=3
    },
    hide(){
      this.show=1
    },

    getgoods() {
      this.axios.get("/pro/goods?pid=" + this.pid).then((res) => {
        this.goods = res.data.results[0];
        this.swipeimg = res.data.results[0].img.split("|");
        this.dimg=res.data.results[0].dimg.split("|");
        this.title=this.goods.title;
        this.price=this.goods.price;
        this.img=this.swipeimg[0]
      });
    },
  },
  mounted() {
    this.getgoods();
  },
};
</script>

<style >
.servebox div{
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background-color: #000;
  margin: 1.5em 0;
}
.servebox p{
  margin: 1.1em 0
}
.servebox h3{
  display: block;
    font-size: 1.17em;
    margin-block-start: 1.1em;
    margin-block-end: 1.1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.servebox li{
  list-style: decimal;
  display: list-item;
  text-align: left;
  
}
.servebox{
  margin-top: 44px;
  padding-left: 10px;
  padding-right: 5px;
  position: absolute;
  right: 0;
  overflow: auto;
  background: #efeff4;
}
.details-img,.details-serve{
  background: #efeff4;
}
.imghead i,.servehead i{
  position: absolute;
  z-index: 1;
  left: 15px;
}
.details-img img{
  width: 100%;
}
.imghead,.servehead{
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
  height: 44px;
  background-color: #fff;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 9;
}
/* .showdetails {
  height: 100vh;
  background: lightcyan;
} */
.detailshead a:last-child {
  margin-right: 1rem;
}
.detailshead a:first-child {
  margin-left: 1rem;
}
.detailshead a {
  width: 30px;
  height: 30px;
  text-decoration: none;
  color: #fff;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50%;
  line-height: 36px;
}
.detailshead {
  width: 100%;
  height: 2.8rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: fixed;
  z-index: 1;
}
.mycart .van-goods-action,
.mycart .van-goods-action-icon {
  background-color: #f7f7f8;
}
.goodsdetails ul {
  background: #fff;
  /* margin: 1rem 0; */
}
.goodsdetails {
  background: #eee;
  padding: 2.2rem 0 4.5rem 0;
}
.goodsdetails a i {
  margin-left: 18rem;
}
.goodsdetails a {
  text-decoration: none;
  outline: none;
  color: #3d4145;
}
.stockstyle {
  margin-right: 1rem;
}
.goodsinfo .van-stepper__input {
  width: 6rem;
}
.pricestyle b {
  font-size: 20px;
}
.goodsinfo .pricestyle {
  color: #e4393c;
  margin-right: 0.8rem;
}
.goodsinfo li:first-child > div:last-child {
  font-size: 0.55rem;
  color: #929292;
  margin-right: 1rem;
}
.count .van-stepper {
  position: absolute;
  z-index: 1;
  left: 20%;
  /* margin-right: 10rem; */
}
.goodsinfo ul li,
.goodsdetails ul li {
  list-style: none;
  padding-left: 0.8rem;
  text-align: left;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
  min-height: 2.8rem;
  font-size: 13px;
  border-bottom: 1px solid #ebedf0;
}
.detailswipe img {
  width: 100%;
  height: 100%;
}
.detailswipe {
  /* margin-top: 45px; */
  padding-bottom: 5px;
  background-color: #eee;
}

.detailswipe .van-swipe__indicator {
  background-color: #fff;
  opacity: 1;
}
</style>