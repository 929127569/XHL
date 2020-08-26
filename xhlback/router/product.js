const express=require('express');
const pool=require('../pool.js');

const router=express.Router();

router.get('/goods',(req,res)=>{
    let pid=req.query.pid;
    pool.query('select * from xhl_product where pid=?',[pid],(err,results)=>{
        if(err)throw err;
        res.send({message:'商品查询成功',code:1,results:results})
    })
})


router.get('/productlist',(req,res)=>{
    let kw=req.query.kw;
    pool.query(`select * from xhl_product where title like '%${kw}%' or fname like '%${kw}%'`,[kw],(err,results)=>{
        if(err)throw err;
        res.send({message:'商品查询成功',code:1,results:results});
    })
})


module.exports=router;