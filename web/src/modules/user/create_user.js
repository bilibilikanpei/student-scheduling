import React from 'react';
import fd from '../../base/fetchData';
import { Button, Modal, Form, Input, Select } from 'antd';

class Craete extends React.Component {
    constructor() {
        super();
        this.state = {
            visible: false,
            submitting: false,
            major_list: []
        }
    }

    componentDidMount() {
        // this.get_major();
    }
    //显示弹层
    handler_show() {
        this.setState({
            visible: true
        });
    }
    //关闭弹层
    handler_hidden() {
        this.setState({
            visible: false
        });
        //重置表单
        this.props.form.resetFields();
    }

    get_major() {
        fd.getJSON(fd.ports.option.major.list).then((result) => {
            this.setState({
                major_list: result
            });
        }).catch((error) => {
            Modal.error({
                title: "加载专业列表失败",
                content: error.message
            });
        });
    }

    //提交动作
    handler_submit(e) {
        if (e) {
            e.preventDefault();
        }

        this.props.form.validateFields((error, values) => {
            if (!error) {
                //验证通过，提交请求
                this.setState({ submitting: true });
                fd.postJSON(fd.ports.option.class.create, values).then(() => {
                    this.setState({ submitting: false });
                    this.handler_hidden();
                    // setstate就已经让组件刷新了
                    // this.props.handler_refresh();
                }).catch((error) => {
                    Modal.error({
                        title: "添加教室出错",
                        content: error.message
                    })
                    this.setState({ submitting: false });
                });
            }
        });


    }

    render() {
        //验证组件
        const { getFieldDecorator } = this.props.form;
        //表单内输入项大小比例 
        const formItemLayout = {
            labelCol: {
                xs: { span: 24 },
                sm: { span: 4 },
            },
            wrapperCol: {
                xs: { span: 24 },
                sm: { span: 20 },
            },
        };

        const FormItem = Form.Item;

        return (
            <span>
                <Button icon="file-add" onClick={() => this.handler_show()}>注册</Button>
                <Modal
                    title="注册"
                    visible={this.state.visible}
                    onCancel={() => this.handler_hidden()}
                    maskClosable={false}
                    footer={null}
                >
                    <Form onSubmit={(e) => this.handler_submit(e)}>
                        <FormItem
                            {...formItemLayout}
                            label="登陆账号"
                        >
                            {getFieldDecorator('class_name', {
                                rules: [{
                                    max: 20,
                                    message: `最多只能输入20个字`
                                }, {
                                    required: true,
                                    message: '必需输入登陆账号',
                                }],
                            })(
                                <Input />
                            )}
                        </FormItem>
                        <FormItem
                            {...formItemLayout}
                            label="用户名称"
                        >
                            {getFieldDecorator('major_id', {
                                rules: [{
                                    required: true,
                                    message: '必需选择名称!',
                                }]
                            })(
                                <Select placehoder="请选择名称">
                                    {
                                        this.state.major_list.map((v, k) => {
                                            return (
                                                <Select.Option key={v.major_id}>{v.major_name}</Select.Option>
                                            )
                                        })
                                    }
                                </Select>
                            )}
                        </FormItem>
                        <FormItem
                            {...formItemLayout}
                            label="班级状态"
                        >
                            {getFieldDecorator('closed', {
                                rules: [{
                                    required: true,
                                    message: '必需选择',
                                }],
                                initialValue: '0'
                            })(
                                <Select
                                    //过滤属性
                                    showSearch
                                    filterOption={(input, option) => option.props.children.toLowerCase().indexOf(input.toLowerCase()) >= 0}
                                >
                                    <Select.Option key="0">正常</Select.Option>
                                    <Select.Option key="1">闭班</Select.Option>
                                </Select>
                            )}
                        </FormItem>
                        <FormItem
                            {...formItemLayout}
                            label="备注信息"
                        >
                            {getFieldDecorator('remark', {
                                rules: [{
                                    max: 200,
                                    message: `最多只能输入200个字`
                                }],
                            })(
                                <Input.TextArea />
                            )}
                        </FormItem>
                        <FormItem
                            wrapperCol={{ xs: { offset: 4, span: 20 } }}
                            style={{ marginBottom: 0, textAlign: 'right' }}
                        >
                            <Button type="primary" htmlType="submit" loading={this.state.submitting}>提交</Button>

                            <Button onClick={() => this.handler_hidden()} style={{ marginLeft: 15 }} >关闭</Button>
                        </FormItem>
                    </Form>
                </Modal>
            </span>
        );
    }
}

export default Form.create()(Craete)