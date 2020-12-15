// 用户模块包含登陆和注册
const express = require('express');
const pool = require('../pool');     //引入连接池
const router = express.Router();    //创建路由器
module.exports = router

//用户注册功能接口
router.post('user/register',(req,res)=>{
    let uname = req.body.uname; 
    console.log(uname);
    if (!uname) {    //验证用户名不能为空
        let output = {
            code: 400,
            msg: 'uname required'
        }
        res.send(output);
        return;
    }
    let myRegExp = /\w+@\w+\.\w+(\.cn)?/ig;
    if (!myRegExp.test(uname)) {   //正则判断用户的名的格式必须符合email格式
        let output = {
            code: 401,
            msg: 'uname required'
       }
       res.send(output);
       return; 
    } 

    
    let upwd = req.body.upwd;
    if (!upwd) {         //验证密码不能为空
        let output = {
            code: 402,
            msg: 'upwd required'
        }
        res.send(output);
        return;
    }
    if (upwd.length>=8 && upwd.length<=12) {
        next();     //密码的长度必须位于8-12位之间
    } else {  
        let output ={
            code: 403,
            msg: 'upwd required'
        }
        res.send(output);
        return;
    }
    let phone = req.body.phone;
    if (!phone) {   //电话不能为空!
        let output = {
            code: 405,
            msg: 'phone required'
        }
        res.send(output);
        return;
    }
    let myPhoneReg = /1[3-9]\d{9}/ig;
    if (phone.length!==11) {
        let output = {  //电话长度必须等于11位
            code: 406,
            msg: 'phone required!'
        }
        res.send(output);
        return
    }
    if (!myPhoneReg.test(phone)) {
        let output = {  //验证phone的格式
            code: 407,
            msg: 'required!'
        }
        res.send(output);
        return;
    }
    //执行captcha验证

    let captcha = req.body.captcha;
    if (!captcha) { //验证码不能为空
        let output = {
            code: 408,
            msg: 'captcha required'
        }
        res.send(output)
        return
    }
    captcha = captcha.toLowerCase();    //转为小写
    if(captcha !== req.session.captchaRegister) {
        let output = {
            code: 409,
            msg: 'captcha error'
        }
        res.send(output);
        return;
    }
    delete req.session.captchaRegister  //验证码使用完毕,需要从session中删除

    //向数据库执行插入语句
    //验证用户名是否存在
    let sql = 'SELECT pid FORM personalInformation WHERE uname=?'
    pool.query(sql,uname,(err,result) => {
        if (err) {
            next(err);
            return
        }
        if (result.length > 0){     //有记录代表数据库已经有这个用户名了---重复了
            let output = {
                code: 501,
                msg: 'uname already exists'
            }
            res.send(output);
            return;
        }
        // 验证码电话号码是否存在
        let sql = 'SELECT pid FROM personalInformation WHERE phone=?';
        pool.query(sql,phone,(err,result) => {
            if(err) {
                next(err);
                return;
            }
            if (result.length>0) {  //根据您phone查询到已经存在对应的记录
                let output = {
                    code: 502,
                    msg: 'phone already exists'
                }
                res.send(output);
                return;
            }
            // 向数据库执行一条插入语句
            let sql = 'INSERT INTO personalInformation(uname,upwd,phone) VALUES(?,?,?)';
            pool.query(sql,[uname,upwd,phone],(err,result) => {
                if(err) {
                    next(err);
                    return;
                }
                let output = {
                    code: 200,
                    msg: 'register succ',
                    pid: result.insertId
                }
                res.send(output);
            })
        })
    })
})





//用户登录功能点
router.post('/login',(req, res, next)=>{
    let uname = req.body.uname;
    if(!uname) {
        let output = {
            code: 401,
            msg: 'uname required'
        }
        res.send(output);
        return;
    }
    let upwd = req.body.upwd;
    if(!upwd) {
        let output = {
            code: 402,
            msg: 'upwd required'
        }
        res.send(output);
        return;
    }
    //2.执行登录验证
    let sql = 'SELECT pid,pName,theName FROM personalInformation WHERE pName=? AND pPwd=?';
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) {
            next(err);
            return;
        }
        if(result.length===0) {
            let output = {
                code: 405,
                msg: 'uname of upwd error'
            }
            res.send(output);
            return;
        }
        //根据客户端提交的uname和upwd查询到相关记录
		//3.1将当前用户的登录信息保存到服务器端,给客户端一个Set-Cookie: sid=...
		// console.log('SESSION: ',req.session);
		req.session.userInfo = result[0]	//在服务器端保存用户的登录信息uid/uname
        // req.session.svae()	//将当前的session保存到服务器端
        let output = {
            code: 200,
            msg: 'login succ'
        }
        res.send(output);
    })
})
