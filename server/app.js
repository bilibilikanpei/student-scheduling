var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');


var app = express();

// view engine setup


// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

/*
业务路由引入 begin --------------------------
*/



//教室
app.use("/admin/room", require("./routes/class_room"));
//课程
app.use("/admin/lesson", require("./routes/lesson"));
//专业
app.use("/admin/major", require("./routes/major"));
//班级
app.use("/admin/class", require("./routes/class"));
// 学生管理
app.use("/admin/student", require("./routes/student"));
//课程表
app.use("/admin/schedule", require("./routes/schedule"));
//用户管理
app.use("/admin/user", require("./routes/user"));
//教师管理
app.use("/admin/teacher", require("./routes/teacher"));





/*
业务路由引入 end --------------------------
*/
// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
