import React from 'react';
import { Modal } from 'antd';
import Login from '../modules/login/login';

export default class extends React.Component {
    constructor() {
        super();
        this.state = {
            ModalText: 'Content of the modal',
            visible: false,
            confirmLoading: false,
        }
    }
    handleOk = () => {
        this.setState({
            ModalText: 'The modal will be closed after two seconds',
            confirmLoading: true,
        });
        setTimeout(() => {
            this.setState({
                confirmLoading: false,
            });
        }, 2000);
    }

    handleCancel = () => {
        console.log('Clicked cancel button');
        this.setState({
            visible: false,
        });
    }
    render() {
        return (
            <div className='login_back'>
                <Login />
            </div>
        )
    }
}