const express=require('express');
const pool=require('../pool.js');

const router=express.Router();

router.post('/regsiter',(req,res)=>{
  let phone=req.body.phone;
  let upwd=req.body.upwd;
  pool.query('SELECT COUNT(uid) AS count FROM xhl_user WHERE phone=?',[phone],(err,results)=>{
    if(err)throw err;
    if(results[0].count){
        res.send({message:'账户已存在',code:0});
    }else{
        pool.query('INSERT xhl_user(phone,upwd) values(?,MD5(?))',[phone,upwd],(err,results)=>{
            if (err) throw err;
            res.send({message:'成功',code:1,results:results});
        })
    }
})
})

router.post('/login',(req,res)=>{
  let phone=req.body.phone;
  let upwd=req.body.upwd;
  let sql='select phone,nickname,upwd from xhl_user where phone=? and upwd=MD5(?)';
  pool.query(sql,[phone,upwd],(err,results)=>{
      if(err)throw err;
      if(results.length==1){
    res.send({message:'成功',code:1,results:results})
  }else{
    res.send({message:'失败',code:0,results:results})
  }
  })
})


module.exports=router;