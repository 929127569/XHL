<template>
  <div>
    <div class="cartnav">
      <van-tabs v-model="active">
        <van-tab title="商城">
          <div class="cartbox">
            <div>
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#iconjiangpaipaiming" />
              </svg>
              <span>食品</span>
            </div>
            <div class="cartlist" v-for="(i,k) of 3" :key="k">
              <div class="cartlistitem" >
                <label>
                  <input type="checkbox" class="cartcheck" />
                </label>
                <img src="../assets/1.jpg" alt />
                <a href="javascript:;">
                  <div>
                    <span>盒装雪花酥280g</span>
                    <span class="cartprice">￥58.00</span>
                  </div>
                  <div>
                    <span></span>
                    <span>x1</span>
                  </div>
                </a>
              </div>
              <div class="cartcount">
                <van-stepper v-model="value" />
              </div>
            </div>
          </div>
        </van-tab>
        <van-tab title="门店">内容 2</van-tab>
      </van-tabs>
    </div>
    <div class="carthead">
      <h3>购物车</h3>
      <button>
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#iconshanchu" />
        </svg>
      </button>
    </div>
    <div class="cartfoote">
      <label >
        <input type="checkbox">全选
      </label>
      <div class="cartfoote-i">
        <span>合计: <b>￥0</b> </span>
        <span>不含运费</span>
      </div>
      <button>结算(0)</button>
    </div>

    <my-footer :active="'cart'"></my-footer>
  </div>
</template>

<script>
// import myFooter from '../components/MyFooter.vue'
export default {
  data() {
    return {
      active: 0,
      value: 1,
    };
  },
  // components:{
  //   myFooter
  // }
};
</script>


<style >
/* .cartlistitem label{
  width: 20px;
  height: 20px;
  border-radius: 50% !important;
} */
.cartfoote-i span:last-child{
  font-size: 12px;
}
.cartfoote-i b{
  color: #e4393c;
}
.cartfoote-i{
  display: flex;
  flex-flow: column nowrap;
  margin-left: 35%;
  font-size: 15px;
}
.cartfoote label{
  margin-left: 10px;
  /* font-size: 17px; */
}
.cartfoote button{
  height: 100%;
  border: none;
  outline: none;
  background: #9C9A9A;
  padding: 0px 8px;
  color: #fff;
  font-size: 17px;
}
.cartfoote{
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: fixed;
  bottom: 50px;
  height: 2.8rem;
  width: 100%;
  background: #f7f7f8;
  color: #6d6d72;
  text-align: left;
}
.cartprice{
  font-size: 17px;
  color: #e4393c;
}
.cartcount .van-stepper__input {
  width: 80px;
  background-color: #fff;
}
.cartcount .van-stepper {
  display: flex;
  justify-content: flex-end;
  padding: 9px 9px 9px 0;
}
.cartcount {
  background-color: #fcfcfc;
}
.cartlistitem label {
  margin-left: 5px;
}
.cartlistitem input[type="checkbox" i] {
  width: 20px;
  height: 20px;
  border-radius: 50% !important;
  background-color: red !important;
  border: none;
}
.cartbox {
  width: 90%;
  margin: 0 auto;
}
.cartbox > div:first-child {
  color: #6d6d72;
  font-size: 14px;
  background-color: #fff;
  text-align: left;
  padding: 10px 0 10px 20px;
  border-bottom: 1px solid #eee;
}
.cartbox > div:first-child span{
  margin-left: 5px;
}
.cartlist{ 
  margin-bottom: 15px;
}
.cartlistitem {
  /* border: 1px solid yellow; */
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-start;
  align-items: center;
  padding: 10px 0;
  background-color: #fff;
}
.cartlistitem img {
  /* width: 100%; */
  margin-left: 10px;
  width: 60px;
}
.cartlistitem a {
  margin-left: 10px;
  text-decoration: none;
  outline: none;
  color: #5f646e;
  font-size: 14px;
  /* display: flex; */
  /* flex-flow: row wrap; */
  /* justify-content: space-between; */
  /* align-items: center; */
  height: 100%;
  flex-grow: 2;
  padding-right: 15px;
}
.cartlistitem a div {
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  align-items: center;
  padding-bottom: 0.8rem;
}
.cartnav .van-tabs__content {
  /* border: 1px solid red; */
  margin-top: 2.9rem;
  height: 100%;
  min-height: 700px;
  background-color: #efeff4;
}
.carthead {
  background-color: #f7f7f8;
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  height: 44px;
  align-items: center;
  position: absolute;
  z-index: 1;
  width: 100%;
  top: 2.9rem;
}
.carthead button {
  position: absolute;
  z-index: 2;
  border: 0;
  outline: none;
  /* top: 1rem; */
  right: 0.6rem;
  /* width: 1rem; */
  /* height: 1.5rem; */
}
/* .carthead .icon{
  width: 1rem;
  height: 1rem;
} */
/* .carthead button i{
  width: 16px;
  height: 32px;
} */
</style>