// import ThreeMessageVue from '@/pages/ThreeMessage.vue';
// import EchartsMessageVue from '@/pages/EchartsMessage.vue';
// import DataList from '@/pages/DataList.vue';
import TablePage from '@/pages/Table';
import EchartPage from '@/pages/Echart';
import ThreePage from '@/pages/Three';


export default [
    {
        path: '/',
        name: '3D模型',
        component: ThreePage
    },
    {
        path: '/echartsmessage',
        name: '数据统计',
        component: EchartPage
    },
    {
        path: '/data-list',
        name: '数据列表',
        component: TablePage
    },
];