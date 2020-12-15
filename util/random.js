/*
*随机数生成模块
*/
module.exports = {
	//返回指定范围内的随机整数
	randNum(min,max){
		let n = Math.random(); //0~1随机小数
		n = n * (max-min)	   //0~(max-min)间的随机小数
		n += min			   //min~max间的随机小数
		n = Math.floor(n)	   //min~max间的随机整数	,可能为min,不能为max
		return n 
	},
	
	// 返回一个随机的颜色值,形如: #ab5c9d
	randColor(min,max){
		let red = this.randNum(min,max);
		let green = this.randNum(min,max);
		let blue = this.randNum(min,max);
		//将十进制转换为十六进制
		red = red.toString(16);
		green = green.toString(16);
		blue = blue.toString(16);
		//保证每个颜色值为两位
		red = red.length<2 ? '0' + red : red
		green = green.length<2 ? '0' + green : green
		blue = blue.length<2 ? '0' + blue : blue
		return '#' + red + green + blue
	},
	
	// 返回一个随机的文件名
	// 参数: oldName表示该文件原始名,例如: 123.456.png
	//返回值:	时间戳+六位随机数+.png
	randFileName(oldName){
		let f = Date.now()			//时间戳
		f = String(f)			//转换为字符串
		f += this.randNum(100000,1000000)			//六位的随机数
		f += oldName.substring(oldName.lastIndexOf('.') )			//原文件的后缀名
		return f
	}
}