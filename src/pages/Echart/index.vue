<template>
  <div class="echarts-container">
    <div ref="echarts1">
      <div class="panel-footer"></div>
    </div>
    <div class="pie" ref="echarts5">
      <div class="panel-footer"></div>
    </div>
    <div class="pie" ref="echarts6">
      <div class="panel-footer"></div>
    </div>

    <div ref="echarts2">
      <div class="panel-footer"></div>
    </div>

    <div class="line" ref="echarts3">
      <div class="panel-footer"></div>
    </div>

    <div class="line" ref="echarts4">
      <div class="panel-footer"></div>
    </div>
  </div>
</template>

<script>
import { reqMockTableData } from "@/api";
import * as echarts from "echarts";
import {
  echarts1Option,
  echarts2Option,
  echarts3Option,
  echarts4Option,
  echarts5Option,
  echarts6Option,
} from "./config";

export default {
  name: "echart-page",
  data() {
    return {};
  },
  mounted() {
    this.getEcharts1();
    this.getEcharts2();
    this.getEcharts3();
    this.getEcharts4();
    this.getEcharts5();
    this.getEcharts6();
  },
  methods: {
    getEcharts1() {
      reqMockTableData().then(({ data }) => {
        const echarts1 = echarts.init(this.$refs.echarts1);
        echarts1.setOption(echarts1Option);
      });
    },
    getEcharts2() {
      reqMockTableData().then(({ data }) => {
        const echarts2 = echarts.init(this.$refs.echarts2);
        echarts2.setOption(echarts2Option);
      });
    },
    getEcharts3() {
      reqMockTableData().then(({ data }) => {
        const echarts3 = echarts.init(this.$refs.echarts3);
        echarts3.setOption(echarts3Option);
      });
    },
    getEcharts4() {
      reqMockTableData().then(({ data }) => {
        const echarts4 = echarts.init(this.$refs.echarts4);
        echarts4.setOption(echarts4Option);
      });
    },
    getEcharts5() {
      reqMockTableData().then(({ data }) => {
        const echarts5 = echarts.init(this.$refs.echarts5);
        echarts5.setOption(echarts5Option);
      });
    },
    getEcharts6() {
      reqMockTableData().then(({ data }) => {
        const echarts6 = echarts.init(this.$refs.echarts6);
        echarts6.setOption(echarts6Option);
      });
    },
  },
};
</script>

<style lang="less" scoped>
.echarts-container {
  box-sizing: border-box;
  height: 100vh;
  width: 100vw;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  background: url("@/assets/images/bg.jpg") no-repeat top center;
  background-size: cover;
  padding: 0;

  & > div {
    position: relative;
    width: 31%;
    height: 290px;
    background: url(@/assets/images/line\(1\).png) rgba(255, 255, 255, 0.03);

    &::before {
      position: absolute;
      content: "";
      width: 10px;
      height: 10px;
      left: 0;
      top: 0;
      border-left: 2px solid #02a6b5;
      border-top: 2px solid #02a6b5;
    }

    &::after {
      position: absolute;
      content: "";
      width: 10px;
      height: 10px;
      right: 0;
      top: 0;
      border-right: 2px solid #02a6b5;
      border-top: 2px solid #02a6b5;
    }

    .panel-footer {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;

      &::before {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 10px;
        height: 10px;
        border-left: 2px solid #02a6b5;
        border-bottom: 2px solid #02a6b5;
        content: "";
      }

      &::after {
        position: absolute;
        bottom: 0;
        right: 0;
        width: 10px;
        height: 10px;
        border-right: 2px solid #02a6b5;
        border-bottom: 2px solid #02a6b5;
        content: "";
      }
    }
  }
  & > div.pie {
    width: 15%;
  }
  & > div.line {
    width: 48%;
  }
}
</style>
