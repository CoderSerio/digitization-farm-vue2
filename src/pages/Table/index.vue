<template>
  <el-table
    :data="tableData"
    border
    style="width: 100%"
    height="calc(100vh - 40px)"
  >
    <el-table-column
      v-for="col in tableColumns"
      :key="col.prop"
      :prop="col.prop"
      :label="col.label"
    >
      <template slot-scope="scope">
        {{
          col?.render
            ? col?.render(scope.row[col?.prop], scope.row)
            : scope.row[col?.prop]
        }}
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
import { tableColumns } from "./config";
import tableData from "@/mock/tableListData";

export default {
  name: "TablePage",
  data() {
    return {
      tableData,
      tableColumns,
    };
  },
};
</script>

<style lang="less" scoped></style>
