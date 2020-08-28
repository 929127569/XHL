<template>
  <van-tabbar
    v-model="select"
    active-color="#e4393c"
    inactive-color="#929292"
    style="background-color:#f7f7f8"
    z-index="888"
  >
    <van-tabbar-item name="home" icon="wap-home-o" to="/">首页</van-tabbar-item>
    <van-tabbar-item name="store" icon="shop-o" to="/store">门店提货</van-tabbar-item>
    <van-tabbar-item name="cart" icon="shopping-cart-o" to="/cart" :badge="this.$store.getters.getAllCount">购物车</van-tabbar-item>
    <van-tabbar-item name="person" icon="friends-o" to="/person">个人中心</van-tabbar-item>
  </van-tabbar>
</template>

<script>
export default {
  props: ["active"],
  data() {
    return {
      select: this.active,
    };
  },
};
</script>