/**
 * 布局容器组件
 */

import React from 'react';
import { Layout } from 'antd';
import RoutesIns from '../routes';
//功能组件引入
import LeftBar from './left_bar';
import Header from './head_bar';

import Login from './login';
//国际化组件
import { LocaleProvider } from 'antd';
import zh_CN from 'antd/lib/locale-provider/zh_CN';

//引入redux组件
import { Provider } from 'react-redux';
import store from '../redux/store';

import {
    Route,
    Switch
} from 'react-router-dom';
import { connect } from 'react-redux';

var LayoutLogin = () => (
    <Login></Login>
)
var LayoutMain = connect((state) => ({
    viewLoading: state.getIn(["view", "viewLoading"]),
    isMount: state.getIn(["view", "isMount"]),
    collapsed: state.getIn(["view", "collapsed"])
})
)(class extends React.Component {
    constructor() {
        super();
        this.state = {

        }
    }
    render() {
        return (
            <Layout className="layout">
                <LeftBar collapsed={this.props.collapsed} />
                <Layout style={{ paddingBottom: 24 }}>
                    <Header url={window.location.pathname} />
                    {/* 路由内容引入区 */}
                    <RoutesIns />
                </Layout>
            </Layout>)
    }
})


class ViewLayout extends React.Component {
    render() {
        return (
            <Provider store={store}>
                <LocaleProvider locale={zh_CN}>
                    <Switch>
                        <Route path="/login" component={LayoutLogin}></Route>
                        <Route component={LayoutMain}></Route>
                    </Switch>
                </LocaleProvider>
            </ Provider >
        )
    }
}
export default ViewLayout;