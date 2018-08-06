//数据库链接
const connection_object = {
    host: `localhost`,
    user: 'root',
    password: '123456',
    database: 'c4_school_oa',
    port: 3306
}
//数据库链接对像
const pool = require("mysql").createPool(connection_object)
//QUERY对像
module.exports = (queryString, params) => {
    return new Promise((resolve, reject) => {
        pool.query(queryString, params, (error, results, fields) => {
            if (error) {
                reject(error)
            } else {
                resolve(results, fields);
            }
        });
    });
}