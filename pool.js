// 创建连接池
const mysql = require('mysql');
module.exports = mysql.createPool({
    host: '127.0.0.1',
    port: '3306',
    user: 'root',
    password: '',
    database: 'hlj',        //数据库
    connectionLimit: 10     //数据库最大同时连接数
})