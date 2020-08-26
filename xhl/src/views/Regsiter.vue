<template>
  <div class="regsiter">
    <div class="reghead">
      <a href="javascript:history.go(-1)">
        <van-icon name="arrow-left" color="#0894ec" />
      </a>
      <div>欢迎注册</div>
    </div>
    <div class="regfrom">
      <div class="regphone">
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#iconshouji" />
        </svg>
        <input type="text" placeholder="请输入手机号码" v-model="phone" @blur.capture="checkphone">
      </div>
      <div class="reginput"><input type="text" placeholder="请输入图像验证码" v-model="code" @blur.capture="checkcode"><img src="../assets/kaptcha.jpg" alt=""></div>
      <div class="reginput"><input type="password" placeholder="请输入密码(手机验证码)" v-model="upwd" @blur.capture="checkupwd"><button>发送短信验证码</button></div>
    </div>
    <div class="notice">
      <b style="color:red">*</b>
      注册即视为同意
      <a href="javascript:;">杏花楼商城会员注册协议</a>
    </div>
    <button class="regbtn" @click="regsiter">下一步</button>
  </div>
</template>

<script>
export default {
  data(){
    return{
      phone:'',
      upwd:'',
      code:''
    }
  },
  methods:{

    checkphone(){
      let phone=this.phone;
      let phoneRegExp=/^1[3-9]\d{9}$/;
      if(phone==''){
        this.$toast('手机号码不正确');
        return false;
      }else if(phoneRegExp.test(phone)){
        return true;
      }else{
        this.$toast('手机号码不正确');
        return false;
      }
      // console.log(this.phone);
    },
    checkupwd(){
      let upwd=this.upwd;
      let upwdRegExp=/^[0-9A-Za-z_]{8,20}$/;
      if(upwd==''){
        this.$toast('密码长度8~16位');
        return false
      }else if(upwdRegExp.test(upwd)){
        return true;
      }else{
        this.$toast('密码格式不正确')
        return false;
      }
    },
    checkcode(){
      let codeRegExp=/^x8yb4$/gi;
      if(codeRegExp.test(this.code)){
        return true;
      }
    },
    regsiter(){
      if(this.phone==''){
        this.$toast('请输入手机号码')
      }else if(this.checkphone()&&this.checkupwd()&&this.checkcode()){
        this.axios.post('/user/regsiter','phone='+this.phone+'&upwd='+this.upwd).then(res=>{
          if(res.data.code==0){
            this.$toast('已注册过该手机号码，请前往登录')
          }else if(res.data.code==1){
            this.$toast('注册成功')
            this.$router.push('/login')
          }
        })
      }
    }

  }
}
</script>

<style scoped>
.regbtn {
  width: 92%;
  background: #e4393c;
  height: 36px;
  border: none;
  outline: none;
  border-radius: 5px;
  color: #fff;
  margin-top: 25px;
}
.notice a{
  color: #0894ec;
}
.notice{
  margin-top: 40px;
  display: flex;
  justify-content: center;
  width: 92%;
  text-align: left;
  font-size: 15px;
  color: #888;
}
.reginput button{
  border: none;
  font-size: 13px;
}
.reginput img{
  width: 35%;
  max-width: 120px;
  height: 34px;
}

.reginput input{
  height: 32px;
  padding: 1px 10px;
  border-radius: 3px;
  width: 55%;
}
.reginput {
  background-color: #efeff4;
  display: flex;
  flex-flow: row nowrap;
  justify-content: space-between;
  align-items: center;
}
.regfrom input{
  border: none;
}
.regphone svg{
  padding: 0 15px;
}
.regphone{
  background: #fff;
  /* height: 44px; */
  padding:13px 0 ;
  border-radius: 3px;
  
}
.regfrom div{
  width: 92%;
  margin: 10px 0;
  text-align: left;
}
.regfrom{
  /* width: 90%; */
  display: flex;
  flex-flow:column nowrap ;
  justify-content: center;
  align-items: center;
  padding-top: 44px;
  /* background-color: #efeff4; */
}
.regsiter {
  height: 100vh;
  background-color: #efeff4;
}
.reghead a {
  position: absolute;
  z-index: 1;
  left: 15px;
}
.reghead {
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