/** ajax 组件 */

//引入fetch
import 'whatwg-fetch';
//引年接口列表
import ports from '../options/ports';

// 把对像格式参数添加到url末尾
function UrlQuery(url, params) {
    let paramsArray = [];
    //拼接参数  
    Object.keys(params).forEach(key => paramsArray.push(key + '=' + params[key]))
    if (url.search(/\?/) === -1) {
        url += '?' + paramsArray.join('&')
    } else {
        url += '&' + paramsArray.join('&')
    }
    return url;
}

//错误发生时默认的提示方法
// function show_error_message(error) {

// }

//response的处理方法
const check_response = (response) => {
    //第一次then，要判断 状态
    if (response.status === 200) {
        //成功状态
        if (response.headers.get("Content-Type").indexOf('application/json') >= 0) {
            return response.json();
        } else {
            // eslint-disable-next-line
            throw ({ message: `返回结果的Content-Type类型不对` });
        }
    } else {
        //失败状态 根据不同的状态进行处理
        switch (response.status) {
            default:
                // eslint-disable-next-line
                throw { response, message: '请求出错' };
        }
    }
}


//导出主体
export default {
    ports, //接口地址
    getJSON(url, params = {}) {
        return new Promise((resolve, reject) => {
            //FETCH方法有一个问题，除了链接失败以外，所有的返回（包括404、500等……都会resolve，而不会reject
            fetch(UrlQuery(url, params), {
                credentials: 'include' //每次访问都携带cookie
            }).then(check_response).then((json) => {
                resolve(json);
            }).catch((error) => {
                reject(error);
            })
        });
    },
    postJSON(url, params = {}) {
        return new Promise((resolve, reject) => {
            fetch(url, {
                method: "POST",
                credentials: 'include', //每次访问都携带cookie
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(params)
            }).then(check_response).then((json) => {
                resolve(json);
            }).catch((error) => {
                reject(error);
            })
        });
    }
}