/*
*前置中间件
*登录检查中间件,如果客户端尚未登录,则直接返回490响应消息
*/
module.exports = function(req,res,next) {
	if(!req.session || !req.session.userInfo){
		let output = {
			code: 490,
			msg: 'login required'
		}
		res.send(output)
		return	//请求执行完成,后续的路由和中间件都不在执行
	}
	next()	//放行,继续执行后续的中间件或者路由
}