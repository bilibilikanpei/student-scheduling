import React from 'react';
import { Layout } from 'antd';
import LeftNav from './left_nav';

// import { connect } from 'react-redux';

export default (props) => (
    <Layout.Sider
        trigger={null}
        collapsible
        collapsed={props.collapsed}
    >
        <div className="logo" >
            四组学生管理系统
        </div>
        <LeftNav />
    </Layout.Sider>);
