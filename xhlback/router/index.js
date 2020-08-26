const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();

router.get('/banner',(req,res)=>{
    pool.query('select img from xhl_banner',(err,result)=>{
        if(err) throw err;
		// console.log(result)
            res.send(result);
    })
})

router.get('/getpro',(req,res)=>{
    pool.query('select fid,isindex,title,price,img,pid from xhl_product',(err,resuslt)=>{
        if(err) throw err;
        res.send(resuslt);
    })
})

module.exports=router;