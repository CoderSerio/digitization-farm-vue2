import Mock from "mockjs";
// 把JSON数据格式引入进来[JSON数据格式根本没有对外暴露,但是可以进入]
// webpack默认对外暴露的:图片、JSON数据格式
import tableData from './tableData.json'
Mock.mock("/mock/tableData", { code: 200, data: tableData })