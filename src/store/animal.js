import { reqMockTableData } from '@/api';
const state = {
    isCollapse: false,//控制菜单展开还是收起
    tabsList: [
        // {
        //     path: "/",
        //     name: "basicmessage",
        //     label: "基本数据",
        //     icon: "menu",
        //     // url: "Home/Home",
        // },
        {
            path: "/",
            name: "threemessage",
            label: "3D大屏可视化",
            icon: "menu",
            // url: "Home/Home",
        }],
    tableData: []
    //面包屑的数据 
};
const mutations = {
    COLLAPSEMENU(state) {
        state.isCollapse = !state.isCollapse;
    },
    ADDROUTER(state, value) {
        if (value.name !== 'threemessage') {
            const index = state.tabsList.findIndex(item => item === value);
            if (index === -1) {
                state.tabsList.push(value);
            }
        }
    },
    DELETETAG(state, value) {
        const index = state.tabsList.findIndex(item => item === value);
        state.tabsList.splice(index, 1);
    },
    GETTABLEDATA(state, value) {
        state.tableData = value;
        // console.log(state.tableData);
    }
};
const actions = {
    async getTableData({ commit }) {
        let result = await reqMockTableData();
        // console.log(result);
        if (result.data.code == 200) {
            commit("GETTABLEDATA", result.data.data);
            return 'ok';
        } else {
            return Promise.reject(new Error('fail'));
        }
    }
};
const getters = {};
export default {
    state, mutations, actions, getters
};