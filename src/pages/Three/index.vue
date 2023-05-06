<template>
  <div class="wrapper">
    <info-cards :chosenModel="chosenModel"></info-cards>
    <div id="three"></div>
  </div>
</template>

<script>
import * as THREE from "three";
import messageData from "@/mock/messageData";
import InfoCards from "./components/InfoCards/index.vue";
import {
  createCamera,
  createLight,
  createRenderer,
  createscene,
  createCss2dRenderer,
  loadGLTF,
  createControls,
  get3dClickEventTargets,
  loadCss2dObject,
  createAnimation,
} from "@/utils/3d";

export default {
  name: "three-page",
  mounted() {
    this.init3D();
  },
  data() {
    return {
      isLoading: false,
      camera: null,
      scene: null,
      light: null,
      environment: null,
      renderer: null,
      css2dRenderer: null,
      clickInfoCard: null, // 信息卡片,
      chosenModel: null, // 当前选中的模型
      messageData: messageData, // 仓库数据（不知道为什么叫messageData
      timeId: 0, // 全局唯一的计时器id
      updateAnimation: null, // 动画更新函数（火焰动画）
    };
  },
  methods: {
    init3D() {
      const that = this;

      // 初始化各种场景参数
      this.camera = createCamera();
      this.scene = createscene();
      this.light = createLight();
      this.renderer = createRenderer();
      this.css2dRenderer = createCss2dRenderer();

      // 导入光源
      this.scene.add(this.light.ambientLight);
      this.scene.add(this.light.dirLight);
      this.scene.add(this.environment);

      // 创建环境(低配机慎重考虑)
      // initEnvironment(this.scene, this.renderer);

      // 导入动画(火焰)
      this.updateAnimation = createAnimation(
        this.scene,
        "static/images/flame.png",
        15,
        {
          position: {
            z: 0,
            y: 50,
          },
          scale: 50,
        }
      );
      // 隐藏动画(火焰)
      this.updateAnimation(false);

      // 导入模型文件(并且决定是否显示动画火焰)
      loadGLTF(
        this.scene,
        `static/model/model.glb`,
        { scale: 2 },
        (gltf, model) => {
          const that = this;
          const granaryArr = [];
          gltf.scene.traverse(function (object) {
            if (object.type === "Mesh") {
              // 批量更改所有Mesh的材质
              object.material = new THREE.MeshLambertMaterial({
                map: object.material.map, //获取原来材质的颜色贴图属性值
                color: object.material.color, //读取原来材质的颜色
              });
            }
          });
          // 所有粮仓模型的父对象名称：'粮仓'
          const group = gltf.scene.getObjectByName("粮仓");

          group.traverse(function (obj) {
            if (obj.type === "Mesh") {
              const temperature = that.messageData[obj?.name].temperature;
              if (+temperature >= 50) {
                // 播放火焰动画
                that.updateAnimation(true, {
                  position: {
                    x: obj.position.x,
                    y: obj.position.y,
                    z: obj.position.z,
                  },
                });
              }
              granaryArr.push(obj);
            }
          });
          model.add(gltf.scene);

          that.scene.add(model);
        }
      );

      // 创建渲染器
      const el = document.getElementById("three");
      el?.appendChild(this.renderer.domElement);
      el?.appendChild(this.css2dRenderer.domElement);

      // 创建全局点击事件
      document.addEventListener("click", that.handle3dClick);

      // 添加事件控制
      createControls(
        this.scene,
        this.camera,
        this.renderer,
        (scene, camera) => {
          that.renderer.render(scene, camera);
          that.css2dRenderer.render(scene, camera);
        }
      );

      // 绘制渲染
      this.render3d();
    },
    render3d() {
      const that = this;
      this.renderer?.render(this.scene, this.camera);
      this.css2dRenderer?.render(this.scene, this.camera);
      window.requestAnimationFrame(that.render3d);
    },
    handle3dClick(event) {
      if (this.isLoading) return;
      this.isLoading = true;

      const that = this;
      const targets = get3dClickEventTargets(this.scene, this.camera, event);
      const target = targets?.[0];

      // 保证是个仓库才继续操作
      if (!Object.keys(that.messageData ?? {}).includes(target?.object.name)) {
        this.isLoading = false;
        return;
      }
      // 之前选中的失去高亮，新选中的加上高亮
      that.chosenModel?.object?.material.color.set(0xffffff);
      target?.object.material.color.set(0x00ffff);
      that.chosenModel = target;

      // 如果还没有信息卡片那就创建一个
      if (!this.clickInfoCard) {
        this.clickInfoCard = loadCss2dObject(
          that.scene,
          that.getInfoCardHtml(target),
          {}
        );
      }
      this.clickInfoCard.position.copy(target?.object.position);
      this.clickInfoCard.element.innerHTML = this.getInfoCardHtml(
        this.chosenModel?.object
      );
      // console.log(this.chosenModel);
      this.clickInfoCard.position.y += 50;
      this.isLoading = false;
    },
    // 生成点击卡片的内容
    getInfoCardHtml(model) {
      const that = this;
      const data = this.messageData[model?.name];
      let dynamicWeight = 0;

      // 实现一个动态的数值加载（看着就很消耗性能
      window.clearInterval(this.timeId);
      this.timeId = setInterval(() => {
        const dynamic = document.getElementById("dynamic");
        // 有可能切换路由了
        if (!dynamic) {
          window.clearInterval(that.timeId);
          return;
        }
        dynamicWeight += Math.floor(data.weight / 50);
        dynamic.innerHTML = `${dynamicWeight}`;
        if (dynamicWeight >= data?.weight) {
          dynamic.innerHTML = `${data.weight}`;
          window.clearInterval(that.timeId);
        }
      }, 5);

      return `<div class="info-card">
        <div class="info-card-title">
          <div>${data?.granaryName}</div>
          <div>${data?.grain}</div>
          <div class="temperature">
            <img src=${require("@/assets/3d/温度.png")} />
             <div>${data?.temperature}℃</div>
          </div>
          <div class="humidity">
            <img src=${require("@/assets/3d/湿度.png")} />
             <div>${data?.humidity}%</div>
          </div>
        </div>
        <div class="info-card-content">
          <img src=${data?.grainImg} />
          <div id="dynamic"></div>
        </div>
        <div class="info-card-footer">
          <div>已用空间—${data?.grainSize}m³</div>
          <div>总空间—${data?.granarySize}m³</div>
        </div>
        </div>`;
    },
  },
  components: {
    InfoCards,
  },
};
</script>

<style lang="less">
.info-card {
  box-sizing: border-box;
  width: 390px;
  height: 243px;
  background: url("../../assets/3d/信息背景.png");
  background-size: cover;
  color: #fff;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  gap: 18px;
  padding: 32px 0;
  overflow: hidden;

  &-title {
    display: flex;
    justify-content: space-around;
    align-items: center;
    gap: 12px;
    .humidity,
    .temperature {
      display: flex;
      align-items: center;
      gap: 2px;
      img {
        height: 36px;
      }
    }
  }

  &-content {
    height: 100px;
    display: flex;
    justify-content: space-around;
    align-items: center;
    gap: 20px;
    font-size: 48px;
    font-weight: 500;
    color: aqua;

    img {
      height: 80px;
      width: 80px;
      border: aqua 4px solid;
      border-radius: 50%;
    }
  }

  &-footer {
    height: 20px;
    display: flex;
    align-items: center;
    gap: 20px;
    div:nth-child(1) {
      border: aqua 1px solid;
      padding: 8px;
      border-radius: 20px;
      font-weight: 500;
    }
  }
}
</style>
