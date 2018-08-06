const router = require("express").Router();
const dq = require("../base/db_query");
const ho = require("../base/http_output");
const async = require("async");

module.exports = router;

router.get("/list", (req, res) => {
    let keyword = req.query.keyword;
    keyword = !!keyword ? `%${keyword}%` : `%`;

    const $sql_query = `
    SELECT
        teacher.name,
        teacher.mobile,
        teacher.remark
    FROM
        teacher 
    where teacher.name like ?
        ORDER BY user_id DESC`;

    // 总数SQL
    const $sql_total = `
    SELECT count(*) AS total from teacher WHERE teacher.name like ?
    `;

    async.parallel({
        // 查询列表
        list: (callback) => {
            dq($sql_query, keyword).then((result, fields) => {
                callback(null, result);
            }).catch((error) => {
                callback(error);
            });
        },
        // 查询总数
        total: (callback) => {
            dq($sql_total, keyword).then((result, fields) => {
                callback(null, result[0].total)
            }).catch((error) => {
                callback(error);
            });
        }
    }, (error, result) => {
        // 返回结果
        if (!error) {
            ho(res).send(result);
        } else {
            ho(res).internal_error(error).send();
        }
    });
});