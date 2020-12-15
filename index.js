// 创建web服务器
const express = require('express');
const app = express();
let port = 8080;
app.listen(port,()=>{
	console.log('Server Listening on Port:',port);
})
app.use(express.static('./public'))
let bodyParser = require('body-parser');
//app.use(bodyparser.urlencoded({extended:false}))
//使用session处理中间件: ①为当前客户端奉陪session存储空间,并告知客户端sid
// 					    ②当前客户端再次请求时从请求头部读取sid.进而找到该客户对应的session空间,保存req.session对象
let session = require('express-session');
app.use(session({
    secret: 'tedu123',  //自定义生产sid随机数的种子
    saveUninitialized: true,  //是否保存未经初始化过的session数据
    resave: true,   //是否自动保存session数据-即使没有修改过
}))

const userRouter = require('./router/user')
app.use('/user',userRouter)

const captchaRouter = require('./router/captcha')
app.use('/captcha',captchaRouter)





// 自定义错误处理中间件-所有的路由方法中只要执行了next(err)都会调用此中间件
app.use((err,req,res,next)=>{
	//console.log(err)			//开发阶段:此处可以把错误信息输出到控制台
    //fs.write('err.log',err)	//产品阶段:此处可以把错误消息保存到日志
	//向客户端输出一个"合理"的解释
    res.status(500)     //	Internal Server Error
    res.send({
        code: 500,
        msg: 'Sorry! Server tmp error! Please retry later!',
        err: err
    })
})