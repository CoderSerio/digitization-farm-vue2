<template>
  <div class="info-cards">
    <div class="row top">
      <div class="column left">
        <div class="content">
          <div class="temperature">
            <div>时间：</div>
            <div>{{ date }}</div>
            <div>位置：</div>
            <div
              :style="{
                color: temperatureWarningItem.granaryName ? 'red' : '#fff',
              }"
            >
              {{
                temperatureWarningItem.granaryName
                  ? `${temperatureWarningItem.granaryName}温度异常，失火报警！！！`
                  : "一切正常"
              }}
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
            <el-table :data="tableData" border style="width: 100%" height="180">
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
          </div>
        </div>
      </div>
      <!-- <div class="column right"></div> -->
    </div>
  </div>
</template>

<script>
import messageData from "@/mock/messageData";
import infoData from "@/mock/infoData";
import overviewData from "@/mock/overviewData";
import { tableColumns } from "@/pages/Table/config";

export default {
  mounted() {
    this.getTemperatureWarningItem();
  },
  data() {
    return {
      date: new Date(),
      temperatureWarningItem: null,
      messageData,
      infoData,
      overviewData,
      tableColumns,
      tableData: [],
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
          this.temperatureWarningItem = item;
        }
      });
    },
  },
  watch() {
    // TODO: 监听一下choseModel的变化
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
      background: url("../../../assets/3d/信息背景.png");
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
}

.overview-data {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
}
</style>
