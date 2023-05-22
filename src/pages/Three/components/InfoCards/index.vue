<template>
  <div class="info-cards">
    <div class="row top">
      <div class="column left">
        <div class="content">
          <div class="temperature">
            <div>时间：</div>
            <div>{{ dayjs(date).format("YYYY MM DD HH:mm:ss") }}</div>
            <div>位置：</div>
            <!-- <div
              v-for="(item, index) in errorList"
              :style="{
                color: temperatureWarningItem.granaryName ? 'red' : '#fff',
              }"
              :key="index"
            > -->
            <div v-for="(item, index) in errorList" :key="index">
              <!-- {{
                temperatureWarningItem.granaryName
                  ? `${temperatureWarningItem.granaryName}温度异常，失火报警！！！`
                  : "一切正常"
              }}

              {{
                humidityWarningItem.granaryName
                  ? `${humidityWarningItem.granaryName}湿度异常报警！！！`
                  : "一切正常"
              }} -->
              <div v-if="item.temperature > 50" style="color: red">
                {{ `${item.granaryName} 温度异常，失火报警！！！` }}
              </div>
              <div v-if="item.humidity > 25" style="color: red">
                {{ `${item.granaryName} 湿度异常，速速查看！！！` }}
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="column right">
        <div class="content">
          <div class="overview-data">
            <li>
              猪一共有{{ overviewData?.pig?.totalNum }}只， 其中健康个体有{{
                overviewData?.pig?.healthyNum
              }}只
            </li>
            <li>
              牛一共有{{ overviewData?.cow?.totalNum }}只，其中健康个体有{{
                overviewData?.cow?.healthyNum
              }}只
            </li>
            <li>
              羊一共有{{ overviewData?.sheep?.totalNum }}只，其中健康个体有{{
                overviewData?.sheep?.healthyNum
              }}只
            </li>
          </div>
        </div>
      </div>
    </div>
    <div class="row bottom">
      <div class="column left">
        <div class="content">
          <div class="table">
            <el-table
              :row-class-name="() => 'table-row-style'"
              :show-header="false"
              :highlight-current-row="false"
              :setCurrentRow="() => ''"
              :data="statisticsData[chosenModel?.object?.name]?.itemList"
              height="172"
            >
              <el-table-column type="index" width="50" />
              <el-table-column
                v-for="col in tableColumns"
                :key="col.prop"
                :prop="col.prop"
                :label="col.label"
                show-overflow-tooltip
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
          </div>
        </div>
      </div>
      <!-- <div class="column right">
        <div>{{ chosenModel?.object?.name }}</div>
        <div>
          {{ statisticsData[chosenModel?.object?.name] }}
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
import messageData from "@/mock/messageData";
import statisticsData from "@/mock/statisticsData";
import overviewData from "@/mock/overviewData";
import { tableColumns } from "./config";
import dayjs from "dayjs";

export default {
  name: "info-cards",
  mounted() {
    this.getTemperatureWarningItem();
  },
  data() {
    return {
      date: new Date(),
      temperatureWarningItem: null,
      humidityWarningItem: null,
      errorList: [],
      messageData,
      statisticsData,
      overviewData,
      tableColumns,
      dayjs,
    };
  },
  props: ["chosenModel"],
  methods: {
    // 获取温度报警的仓库
    getTemperatureWarningItem() {
      setInterval(() => {
        this.date = new Date();
      }, 1000);
      const keys = Object.keys(this.messageData);
      keys.forEach((key) => {
        const item = this.messageData[key];
        if (+item.temperature >= 50) {
          // this.temperatureWarningItem = item;
          this.errorList.push(item);
        } else if (+item.humidity >= 30) {
          // this.humidityWarningItem = item;
          this.errorList.push(item);
        }
      });
    },
  },
};
</script>

<style scoped lang="less">
.info-cards {
  box-sizing: border-box;
  position: fixed;
  top: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  pointer-events: none;
  color: #fff;
  font-weight: 600;
  .row {
    display: flex;
    justify-content: space-between;
    .column {
      width: 520px;
      height: 240px;
      background: url("../../../../assets/3d/信息背景.png");
      background-size: cover;
      margin: 10px 0 64px;
      position: relative;
      .content {
        box-sizing: border-box;
        position: absolute;
        top: 40px;
        left: 22px;
        width: calc(100% - 44px);
        height: calc(100% - 40px);
        padding: 10px;
        pointer-events: auto;
      }
    }
  }
}

.temperature {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 12px;
  overflow: scroll;
  &&::-webkit-scrollbar-corner {
    background-color: transparent;
  }
  &&::-webkit-scrollbar  {
    width: 10px;
    // height: 10px; // 高度写不写，都不影响，因为会根据内容的长度自动计算
  }

  &&::-webkit-scrollbar-thumb {
    background: #ccc; // 滑块颜色
    border-radius: 5px; // 滑块圆角
  }

  &&::-webkit-scrollbar-thumb:hover {
    background: #f40; // 鼠标移入滑块变红
  }

  &&::-webkit-scrollbar-track:vertical {
    border-radius: 10px; // 轨道圆角
    background-color: #1890ff // 轨道颜色 ;
  }
}

.overview-data {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
.el-table {
  background-color: transparent;
}
</style>

<style>
.table-row-style {
  background-color: transparent !important;
  color: #fff;
}

.el-table tbody tr:hover > td {
  background: transparent !important;
  cursor: pointer;
}
</style>
