//这是学员管理
import React from 'react';
import {
    Button, Table, Spin, Modal,
    Form, Input
} from 'antd';


import Container from '../../component/container';

import fd from '../../base/fetchData';

import BtnCrate from './create_teacher';
import Edit from './edit_teacher';
export default class extends React.Component {
    constructor(props) {
        super();


        this.state = {

            keyword: '',//关键字

            major_list: [],
            class_list: [],

            list: [],
            list_total: 0,
            pageSize: 10, //页大小
            pageNumber: 1,//页码


            loading: false,

            editRecord: null, //被选中的行
            showEdit: false //显示编辑窗口
        }

        const { location } = props;
        if (location.state && location.state.class_id) {
            this.state.class_id = location.state.class_id.toString();
        }
    }

    componentDidMount() {
        this.get_list();
        // this.get_class();
        // this.get_major();
    }

    get_major() {
        fd.getJSON(fd.ports.option.major.list).then((result) => {
            this.setState({ major_list: result });
        }).catch((error) => {
            this.setState({ loading: false });
            Modal.error({
                title: "加载专业列表失败",
                content: error.message
            });
        });
    }

    get_class() {
        fd.getJSON(fd.ports.option.class.all_list).then((result) => {
            this.setState({ class_list: result });
        }).catch((error) => {
            this.setState({ loading: false });
            Modal.error({
                title: "加载班级列表失败",
                content: error.message
            });
        });
    }


    get_list() {
        this.setState({ loading: true });
        //构建参数
        let { keyword, pageNumber, pageSize } = this.state;

        fd.getJSON(fd.ports.option.teacher.list, { keyword, pageNumber, pageSize }).then((result) => {
            this.setState({
                list: result.list,
                list_total: result.total,
                loading: false
            });
        }).catch((error) => {
            this.setState({ loading: false });
            Modal.error({
                title: "加载列表失败",
                content: error.message
            });
        });
    }

    handler_remove(student_id) {
        Modal.confirm({
            title: `删除学生`,
            content: `您确认要删除这条数据吗？`,
            onOk: () => {
                fd.postJSON(fd.ports.option.student.remove, { student_id }).then(() => {
                    this.get_list();
                }).catch((error) => {
                    Modal.error({
                        title: "删除学生出错",
                        content: error.message
                    });
                });
            }
        });


    }

    render() {
        //定义表格列
        const table_columns = [{
            title: `教师姓名`,
            dataIndex: `name`
        }, {
            title: '所属班级',
            dataIndex: `major_name`
        }, {
            title: '手机号',
            dataIndex: `mobile`
        }, {
            title: ``,
            key: 'action',
            width: 260,
            render: (text, record) => {
                return (
                    <span>
                        <Button
                            icon="edit"
                            onClick={() => {
                                this.setState({
                                    showEdit: true,
                                    editRecord: record
                                })
                            }}
                        >编辑</Button>
                        <span className="ant-divider" />
                        <Button
                            icon="delete"
                            onClick={() => this.handler_remove(record.student_id)}
                        >删除 </Button>
                    </span>
                );
            }
        }];


        //分页定义
        const pagination = {
            total: this.state.list_total,
            defaultPageSize: this.state.pageSize,
            onShowSizeChange: (pageNumber, pageSize) => {
                this.setState({ pageNumber, pageSize }, () => {
                    this.get_list();
                });
            },
            onChange: (pageNumber, pageSize) => {
                this.setState({ pageNumber, pageSize }, () => {
                    this.get_list();
                });
            },
            showSizeChanger: true
        }



        return (
            <div>
                <Container>
                    <div style={{ padding: 12 }}>
                        <Form layout="inline" style={{}}
                            onSubmit={(e) => {
                                e.preventDefault();
                                this.get_list();
                            }}
                        >
                            <Form.Item>
                                <BtnCrate handler_refresh={() => this.get_list()} />
                            </Form.Item>
                            <Form.Item label="关键字">
                                <Input defaultValue=""
                                    style={{ width: '8em' }}
                                    placeholder="请输入班级名字"
                                    value={this.state.keyword}
                                    onChange={(e) => this.setState({ keyword: e.target.value })}
                                />
                            </Form.Item>
                            <Form.Item>
                                <Button icon="search" htmlType="submit">查找</Button>
                            </Form.Item>
                        </Form>
                    </div>
                </Container>
                <Container>
                    <Spin
                        spinning={this.state.loading}
                    >
                        <div style={{ overflow: 'hidden' }}>
                            <Table
                                columns={table_columns}
                                dataSource={this.state.list}
                                pagination={pagination}
                                rowKey={(r) => r.student_id}
                            />
                        </div>
                    </Spin>
                </Container>
                {
                    this.state.showEdit && <Edit
                        visible={this.state.showEdit}
                        handler_close={() => this.setState({ showEdit: false })}
                        editRecord={this.state.editRecord}
                        handler_refresh={() => this.get_list()}
                    />
                }
            </div >
        );
    }
}