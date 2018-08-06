import React, { Component } from 'react';
import './App.css';
import 'moment/locale/zh-cn'; //引入moment国际化设置
import Layout from './component/layout'
import { BrowserRouter } from 'react-router-dom';

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <Layout />
      </BrowserRouter>
    );
  }
}

export default App;
