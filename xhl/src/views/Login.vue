<template>
  <div class="login">
    <div class="loginhead">
      <a href="/">
        <van-icon name="arrow-left" color="#0894ec" />
      </a>
      <div>欢迎登录</div>
    </div>
    <div class="loginnav">
      <van-tabs v-model="active">
        <van-tab title="密码登录">
          <div>
            <ul>
              <li>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#iconren-copy" />
                  </svg>
                </div>
                <input type="text" placeholder="已验证邮箱/手机号码" v-model="phone" @blur.capture="checkphone"/>
              </li>
              <li>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#iconsuo" />
                  </svg>
                </div>
                <input type="text" placeholder="密码"  v-model="upwd"/>
              </li>
            </ul>
          </div>
        </van-tab>
        <van-tab title="短信登录">
          <div>
            <ul>
              <li>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#iconren-copy" />
                  </svg>
                </div>
                <input type="text" placeholder="请输入手机号码" />
              </li>
              <li>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icondunpai" />
                  </svg>
                </div>
                <input type="text" placeholder="请输入图像验证码" />
              </li>
              <li>
                <div>
                  <svg class="icon" aria-hidden="true">
                    <use xlink:href="#iconsuo" />
                  </svg>
                </div>
                <input type="text" placeholder="请输入动态密码" style="widts:40%" />
                <button>获取动态密码</button>
              </li>
            </ul>
          </div>
        </van-tab>
      </van-tabs>
    </div>

    <div class="loginbtn">
      <button @click="Login">登录</button>
    </div>
    <div class="quickreg">
      <router-link to="/regsiter">快速注册</router-link>
      <!-- <a href="/regsiter">快速注册</a> -->
      <a href="JavaScript:;">忘记密码</a>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      active: 0,
      phone:'',
      upwd:''
    };
  },
  methods:{
    checkphone(){
      let phone=this.phone;
      let phoneRegExp=/^1[3-9]\d{9}$/;
      if(phone==''){
        this.$toast('请输入手机号码');
        return false;
      }else if(phoneRegExp.test(phone)){
        return true;
      }else{
        this.$toast('手机号码不正确');
        return false;
      }
    },

    Login(){
      if(this.checkphone()){
        this.axios.post('/user/login','phone='+this.phone+'&upwd='+this.upwd).then(res=>{
          if(res.data.code==1){
              this.$store.commit('login_mutations',res.data.results);
              sessionStorage.setItem('isLogin',true);
              sessionStorage.setItem('nickname',res.data.results[0].nickname);
              this.$router.push('/')
          }else{
            this.$toast('用户名或密码不正确')
          }
        })
      }
    }

  }
};
</script>

<style >
.quickreg{
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
  padding:15px 15px 0 15px ;
  /* color:#999 ; */
}
.quickreg a{
  color: #999;
  font-size: 17px;
}
.loginbtn button {
  width: 90%;
  background: #e4393c;
  border: none;
  color: #fff;
  height: 38px;
  margin: 15px 0;
  border-radius: 5px;
  line-height: 38px;
}
.loginnav ul li button {
  width: 30%;
  font-size: 14px;
  /* margin-right: 10px; */
  position: absolute;
  right: 10px;
  /* border: 1px solid #999 ; */
}
.loginnav ul li input {
  height: 28px;
  width: 80%;
  border: none;
  outline: none;
}
.loginnav ul li div {
  width: 15%;
}
.loginnav ul li {
  padding: 8px 0;
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-start;
  align-items: center;
  width: 100%;
  background-color: #fff;
  border-bottom: 1px solid #efeff4;
}
.loginnav .van-tab {
  color: #0894ec;
}
.loginnav .van-tabs__nav--line {
  padding: 0;
  height: 90%;
}
.loginnav .van-tabs__line {
  display: none;
}
.loginnav .van-tabs__content {
  margin-top: 5px;
}
.loginnav .van-tab--active {
  color: #fff;
  background: #0894ec;
}
.loginnav .van-tabs--line .van-tabs__wrap {
  height: 28px;
}
.loginnav .van-tabs__nav {
  width: 90%;
  background-color: #efeff4;
  border: 1px solid #0894ec;
  border-radius: 5px;
  color: #0894ec;
}

.loginnav .van-tabs__wrap {
  display: flex;
  justify-content: center;
  /* height: 25px; */
  margin: 20px 0;
}
.login {
  height: 100vh;
  background-color: #efeff4;
}
.loginnav {
  padding-top: 44px;
}
.loginhead a {
  position: absolute;
  z-index: 1;
  left: 15px;
}
.loginhead {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
  align-items: center;
  height: 44px;
  background-color: #fdfdfd;
  position: fixed;
  width: 100%;
  top: 0;
  z-index: 9;
}
</style>