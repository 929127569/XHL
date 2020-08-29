<template>
  <div class="person">
    <div class="percontent">
      <div class="personhead">
        <div class="avata"></div>
        <div v-if="this.$store.state.isLogin" class="logout">
          <button @click="logout">退出</button>
        </div>
        <div class="status" v-else>
          <router-link to="/login">登录</router-link>
        </div>
        <div class="status">
          <span>{{this.$store.state.nickname}}</span>
        </div>
      </div>
      <div class="perli">
        <span>全部订单</span>
        <span>
          查看全部订单
          <van-icon name="arrow" />
        </span>
      </div>
      <div class="personnav">
        <van-tabbar active-color="#646566">
          <van-tabbar-item icon="pending-payment">代付款</van-tabbar-item>
          <van-tabbar-item icon="sign">代发货</van-tabbar-item>
          <van-tabbar-item icon="logistics">待收货</van-tabbar-item>
          <van-tabbar-item icon="smile-comment-o">已收货</van-tabbar-item>
        </van-tabbar>
      </div>
      <div class="personinfo">
        <ul>
          <li class="perli">
            <span>
              <van-icon name="paid" />我的卡卷包
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="gift-o" />我的礼包
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="shop-o" />门店提货
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="flag-o" />门店分布
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="phone-circle-o" />请朋好友通讯录
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="search" />建议&反馈
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
        </ul>
      </div>
      <div class="personinfo">
        <ul>
          <li class="perli">
            <span>
              <van-icon name="cash-back-record" />我的收支
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="refund-o" />分享返利
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="refund-o" />分享返利
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
          <li class="perli">
            <span>
              <van-icon name="refund-o" />分享返利
            </span>
            <span>
              <van-icon name="arrow" />
            </span>
          </li>
 
        </ul>
      </div>
    </div>
    <my-footer :active="'person'"></my-footer>
  </div>
</template>

<script>
import myFooter from "../components/MyFooter.vue";
export default {
  methods: {
    logout() {
      this.$store.commit("logout_mutations", false);
      // sessionStorage.setItem('isLogin',false);
      localStorage.clear();
      sessionStorage.clear();
      // this.$store.state.car=[];
      this.$router.push("/");
    },
  },
  components: {
    myFooter,
  },
};
</script>

<style>
.percontent {
  width: 100%;
  position: absolute;
  bottom: 50px;
  top: 0;
}
.personinfo {
  /* position: relative; */
  margin-top: 20px;
}
.person {
  height: 100vh;
  background-color: #e7e7e7;
  overflow: hidden;
  /* position: relative; */
}
.personnav .van-tabbar--fixed {
  position: relative;
}
.personhead {
  width: 100%;
  height: 150px;
  background: url("../assets/person.jpg") no-repeat center;
  position: relative;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
}
.personhead .logout {
  position: absolute;
  top: 5px;
  right: 5px;
}
.personhead .logout button {
  background-color: rgba(0, 0, 0, 0);
  border: none;
  color: #fff;
}
.avata {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background-color: #fff;
}
.status a,
.status span {
  color: #fff;
}
.status {
  padding-top: 15px;
}
.perli {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 44px;
  font-size: 14px;
  border-bottom: 1px solid #ddd;
  color: #3d4145;
  background: #fff;
}
.perli span:first-child {
  padding-left: 20px;
}
.perli span:last-child {
  padding-right: 20px;
}
</style>