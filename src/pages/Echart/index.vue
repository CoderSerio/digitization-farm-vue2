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

    <!-- <div ref="echarts2">
      <div class="panel-footer"></div>
    </div> -->

    <div class="line" ref="echarts3">
      <div class="panel-footer"></div>
    </div>

    <div class="line" ref="echarts4">
      <div class="panel-footer"></div>
    </div>
  </div>
</template>

<script>
import * as echarts from "echarts";
import {
  getOption1,
  // getOption2,
  getOption3,
  getOption4,
  getOption5,
  getOption6,
} from "./config";
// import echartsData from "@/mock/echartsData";
import { getEchartsData } from "@/api/index";

export default {
  name: "echart-page",
  data() {
    return {
      echartsData: {},
    };
  },
  mounted() {
    const that = this;
    this.getData();
    setInterval(() => {
      this.getData();
    }, 30000);
  },
  watch: {
    echartsData() {
      this.getEcharts1();
      // this.getEcharts2();
      this.getEcharts3();
      this.getEcharts4();
      this.getEcharts5();
      this.getEcharts6();
    },
  },
  methods: {
    getData() {
      getEchartsData().then((res) => {
        this.echartsData = res.data[0].data;
        console.log(res);
      });
    },
    getEcharts1() {
      const echarts1 = echarts.init(this.$refs.echarts1);
      echarts1.setOption(getOption1(this.echartsData?.data1));
    },
    getEcharts2() {
      const echarts2 = echarts.init(this.$refs.echarts2);
      echarts2.setOption(getOption2(this.echartsData.data2));
    },
    getEcharts3() {
      const echarts3 = echarts.init(this.$refs.echarts3);
      echarts3.setOption(getOption3(this.echartsData.data3));
    },
    getEcharts4() {
      const echarts4 = echarts.init(this.$refs.echarts4);
      echarts4.setOption(getOption4(this.echartsData.data4));
    },
    getEcharts5() {
      const echarts5 = echarts.init(this.$refs.echarts5);
      echarts5.setOption(getOption5(this.echartsData.data5));
    },
    getEcharts6() {
      const echarts6 = echarts.init(this.$refs.echarts6);
      echarts6.setOption(getOption6(this.echartsData.data6));
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
    width: 30%;
  }
  & > div.line {
    width: 48%;
  }
}
</style>
