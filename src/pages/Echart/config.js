import * as echarts from "echarts";

export const getOption1 = (data) => {
  const option = {
    color: ["#2f89cf"],
    tooltip: {
      trigger: "axis",
      axisPointer: {
        // 坐标轴指示器，坐标轴触发有效
        type: "shadow", // 默认为直线，可选为：'line' | 'shadow'
      },
    },
    //修改图表大小
    grid: {
      left: "0%",
      right: "0%",
      top: "10px",
      bottom: "4%",
      //刻度标签
      containLabel: true,
    },
    xAxis: [
      {
        type: "category",
        // x轴中更换data数据
        data: ["猪的数量", "牛的数量", "羊的数量"],
        axisTick: {
          alignWithLabel: true,
        },
        //修改刻度标签 相关样式
        axisLabel: {
          //data的颜色改变了 data的字体也改变了
          color: "rgba(255,255,255,.6)",
          fontSize: "12",
        },
        //不显示x坐标轴的样式
        axisLine: {
          show: false,
        },
      },
    ],
    yAxis: [
      {
        type: "value",
        //修改刻度标签 相关样式
        axisLabel: {
          //data的颜色改变了 data的字体也改变了
          color: "rgba(255,255,255,.6 )",
          fontSize: 12,
        },
        //y轴的线条改为了2像素
        axisLine: {
          lineStyle: {
            color: "rgba(255,255,255,.1)",
            width: 2,
          },
        },
        //y轴分割线的颜色
        splitLine: {
          lineStyle: {
            color: "rgba(255,255,255,.1)",
          },
        },
      },
    ],
    series: [
      {
        name: "牲畜数量",
        type: "bar",
        //柱子变小
        barWidth: "35%",
        // series 更换数据

        // 后续获取数据用于显示当前量
        data,
        itemStyle: {
          //修改柱子圆角
          barBorderRadius: 5,
        },
      },
    ],
  };
  return option;
};


export const getOption2 = (data) => {
  const option = {
    //修改图表大小
    grid: {
      left: "22%",
      top: "10%",
      right: "25%",
      bottom: "10%",
      //刻度标签 默认为false
      // containLabel: true
    },
    //不显示x轴的相关信息
    xAxis: {
      show: false,
    },
    yAxis: [
      {
        inverse: true,
        data: ["每日饲料", "抗生素"],
        //不显示y轴线条
        axisLine: {
          show: false,
        },
        // 不显示刻度
        axisTick: {
          show: false,
        },
        //把刻度标签里面的文字颜色设置为白色
        axisLabel: {
          color: "#fff",
        },
      },
      {
        type: "category",
        inverse: true,
        //后续获取数据用于显示当前量
        data,
        // 不显示y轴的线
        axisLine: {
          show: false,
        },
        // 不显示刻度
        axisTick: {
          show: false,
        },
        // 把刻度标签里面的文字颜色设置为白色
        axisLabel: {
          color: "#fff",
          formatter: function (value, index) {
            if (index == 0) {
              return value + "kg/" + 1500 + "kg";
            } else {
              return value + "支/" + 500 + "支";
            }
            // return value;
          },
        },
      },
    ],
    series: [
      {
        name: "条",
        type: "bar",
        //后续获取数据用于显示比例,当前数量/总量
        data,
        yAxisIndex: 0,
        //修改第一组柱子的圆角
        itemStyle: {
          barBorderRadius: 20,
          //此时的color可以修改柱子的颜色
          color: function (params) {
            const myColor = [
              "#1089E7",
              "#F57474",
              "#56D0E3",
              "#F8B448",
              "#8B78F6",
            ];
            return myColor[params.dataIndex];
          },
        },
        //柱子之间的距离
        barCategoryGap: 50,
        //柱子的宽度
        barWidth: 10,
        //显示柱子内的文字
        //图形上的文本标签
        label: {
          show: true,
          //在柱子内显示
          position: "inside",
          //{c}会自动的解析为 数据(第一个对象里面的data里面的数据)
          // {a}是系列名为name
          // {b}为数据名yAxis里面的data
          // {c}是数据值
          formatter: "{c}%",
        },
      },
      {
        name: "框",
        type: "bar",
        data: [100, 100],
        yAxisIndex: 1,
        itemStyle: {
          color: "none",
          borderColor: "#00c1de",
          borderWidth: 3,
          barBorderRadius: 15,
        },
        //柱子之间的距离
        barCategoryGap: 50,
        //柱子的宽度
        barWidth: 15,
      },
    ],
  };
  return option;

};

export const getOption3 = (data) => {
  const option = {
    color: ["#00f2f1", "#ed3f35"],
    tooltip: {
      trigger: "axis",
    },
    legend: {
      textStyle: {
        color: "#4c9bfd", // 图例文字颜色
      },
      right: "10%", // 距离右边10%
    },
    grid: {
      top: "20%",
      left: "3%",
      right: "4%",
      bottom: "3%",
      show: true, // 显示边框
      borderColor: "#012f4a", // 边框颜色
      containLabel: true, // 包含刻度文字在内
    },
    xAxis: {
      type: "category",
      boundaryGap: false,
      data: new Array(24).fill(0).map((i, index) => `${index + 1}`.padStart(2, 0) + '时'),
      axisTick: {
        show: false, // 去除刻度线
      },
      axisLabel: {
        color: "#4c9bfd", // 文本颜色
      },
      axisLine: {
        show: false, // 去除轴线
      },
    },
    yAxis: {
      type: "value",
      scale: true,
      axisTick: {
        show: false, // 去除刻度线
      },
      axisLabel: {
        color: "#4c9bfd", // 文本颜色
      },
      axisLine: {
        show: false, // 去除轴线
      },
      splitLine: {
        lineStyle: {
          color: "#012f4a", // 分割线颜色
        },
      },
    },
    series: [
      {
        name: "目前湿度",
        type: "line",
        // true 可以让我们的折线显示带有弧度
        smooth: true,
        data: data?.humidity
        // data: yearData[0].data[0]
      },
      {
        name: "合适湿度",
        type: "line",
        // true 可以让我们的折线显示带有弧度
        smooth: true,
        data: data?.temperature
      },
    ],
  };
  return option;
};

export const getOption4 = (data) => {
  const option = {
    tooltip: {
      trigger: "axis",
    },
    legend: {
      top: "0%",
      textStyle: {
        color: "rgba(255,255,255,.5)",
        fontSize: "12",
      },
    },
    grid: {
      left: "10",
      top: "30",
      right: "10",
      bottom: "10",
      containLabel: true,
    },
    xAxis: {
      type: "category",
      //直接从0位置开始
      boundaryGap: false,
      // x轴更换数据
      data: new Array(24).fill(0).map((i, index) =>
        `${index + 1}`.padStart(2, 0) + '时'
      ),
      axisLabel: {
        textStyle: {
          color: "rgba(255,255,255,.6)",
        },
      },
      //x轴线的颜色为 rgba(255,255,255,.2)
      axisLine: {
        lineStyle: {
          color: "rgba(255,255,255,.2)",
        },
      },
    },
    yAxis: {
      type: "value",
      axisTick: { show: false },
      axisLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)",
        },
      },
      axisLabel: {
        textStyle: {
          color: "rgba(255,255,255,.6)",
          fontSize: 12,
        },
      },
      // 修改分割线的颜色
      splitLine: {
        lineStyle: {
          color: "rgba(255,255,255,.1)",
        },
      },
    },
    series: [
      {
        name: "当前温度",
        //bar是柱状图
        type: "line",
        // smooth: true,
        // series  第一个对象data数据
        data: data?.humidity,
        //单独修改当前线条的样式
        lineStyle: {
          color: "#0184d5",
          width: 3,
        },
        //填充颜色设置
        areaStyle: {
          // 渐变色，只需要复制即可
          color: new echarts.graphic.LinearGradient(
            0,
            0,
            0,
            1,
            [
              //offset越大变得越明显
              {
                offset: 0,
                color: "rgba(1, 132, 213, 0.4)", // 渐变色的起始颜色
              },
              {
                offset: 0.8,
                color: "rgba(1, 132, 213, 0.1)", // 渐变线的结束颜色
              },
            ],
            false
          ),
          shadowColor: "rgba(0, 0, 0, 0.1)",
        },
        //设置拐点
        Symbol: "circle",
        //拐点大小
        SymbolSize: 8,
        //开始不显示拐点,鼠标经过显示
        showSymbol: false,
        // 设置拐点颜色以及边框
        itemStyle: {
          color: "#0184d5",
          borderColor: "rgba(221, 220, 107, .1)",
          borderWidth: 12,
        },
      },
      {
        name: "适应温度",
        //bar是柱状图
        type: "line",
        // smooth: true,
        // series  第二个对象data数据
        data: data?.temperature,

        lineStyle: {
          normal: {
            color: "#00d887",
            width: 2,
          },
        },
        areaStyle: {
          normal: {
            color: new echarts.graphic.LinearGradient(
              0,
              0,
              0,
              1,
              [
                {
                  offset: 0,
                  color: "rgba(0, 216, 135, 0.4)",
                },
                {
                  offset: 0.8,
                  color: "rgba(0, 216, 135, 0.1)",
                },
              ],
              false
            ),
            shadowColor: "rgba(0, 0, 0, 0.1)",
          },
        },
        // 设置拐点 小圆点
        symbol: "circle",
        // 拐点大小
        symbolSize: 5,
        // 设置拐点颜色以及边框
        itemStyle: {
          color: "#00d887",
          borderColor: "rgba(221, 220, 107, .1)",
          borderWidth: 12,
        },
        // 开始不显示拐点， 鼠标经过显示
        showSymbol: false,
      },
    ],
  };
  return option;
};


export const getOption5 = (data) => {
  const option = {
    color: [
      "#065aab",
      "#066eab",
      "#0682ab",
      "#0696ab",
      "#06a0ab",
      "#0670ab",
    ],
    tooltip: {
      trigger: "item",
      formatter: "{a} <br/>{b}:{c}只 ({d}%)",
    },
    legend: {
      bottom: "0%",
      itemWidth: 10,
      itemHeight: 10,
      textStyle: {
        color: "rgba(255,255,255,.5)",
        fontSize: "12",
      },
    },
    series: [
      {
        name: "牲畜数量",
        type: "pie",
        center: ["50%", "45%"],
        radius: ["40%", "60%"],
        label: {
          show: false,
          // position: 'center'
        },
        // 链接文字和图形的线是否显示(bilibili不显示)
        // 不显示连接线 加上就显示连接线(可以用 可以不用)
        labelLine: { show: false },
        //  series 中的数据
        //  value值的大小影响饼状图的大小
        data,
      },
    ],
  };
  return option;
};

export const getOption6 = (data) => {
  const option = {
    color: [
      "#006cff",
      "#60cda0",
      "#ed8884",
      "#ff9f7f",
      "#0096ff",
      "#9fe6b8",
      "#32c5e9",
      "#1d9dff",
    ],
    tooltip: {
      trigger: "item",
      formatter: "{a} <br/>{b}:{c}只 ({d}%)",
    },
    legend: {
      bottom: "0",
      itemWidth: 10,
      itemHeight: 10,
      textStyle: {
        colcolor: "rgba(255,255,255,.5)",
        fontSize: 10,
      },
    },
    series: [
      {
        name: "牲畜总量",
        type: "pie",
        radius: ["10%", "70%"],
        center: ["50%", "50%"],
        roseType: "radius",
        //图形的文字标签
        label: {
          fontSize: 10,
        },
        //链接图形和文字的线条
        labelLine: {
          //length链接图形的线条
          length: 6,
          //length2链接文字的线条
          length2: 8,
        },
        data,
      },
    ],
  };
  return option;
};