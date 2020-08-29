<template>
  <div class="store">
    <div class="storehead">
      <a href="javascript:history.go(-1)">
        <van-icon name="arrow-left" color="#0894ec" />
      </a>
      <div>门店提货</div>
    </div>
    <div class="storenav">
      <van-tabs v-model="active">
        <van-tab title="预约单提货"></van-tab>
        <van-tab title="电子券提货"></van-tab>
      </van-tabs>
    </div>
    <my-footer :active="'store'"></my-footer>
  </div>
</template>


<script>
export default {
  data() {
    return {
        active:1,
    };
  },
  methods: {},
};
</script>


<style >
.storenav .van-tab {
  color: #0894ec;
}
.storenav .van-tabs__nav--line {
  padding: 0;
  height: 90%;
}
.storenav .van-tabs__line {
  display: none;
}
.storenav .van-tabs__content {
  margin-top: 5px;
}
.storenav .van-tab--active {
  color: #fff;
  background: #0894ec;
}
.storenav .van-tabs--line .van-tabs__wrap {
  height: 28px;
}
.storenav .van-tabs__nav {
  width: 90%;
  background-color: #efeff4;
  border: 1px solid #0894ec;
  border-radius: 5px;
  color: #0894ec;
}

.storenav .van-tabs__wrap {
  display: flex;
  justify-content: center;
  /* height: 25px; */
  margin: 20px 0;
}
.store {
  height: 100vh;
  background-color: #efeff4;
}
.storenav {
  padding-top: 44px;
}
.storehead a {
  position: absolute;
  z-index: 1;
  left: 15px;
}
.storehead {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
  height: 44px;
  background-color: #fbfbfb;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 9;
}
</style>