import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';
import {
  CSS2DRenderer,
  CSS2DObject,
} from 'three/examples/jsm/renderers/CSS2DRenderer.js';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls';
import { Sky } from 'three/examples/jsm/objects/Sky';
import { Water } from 'three/examples/jsm/objects/Water';
import waterTexture from '@/assets/images/water.jpg';

/** 创建场景 */
export const createScence = () => {
  const scence = new THREE.Scene;
  scence.fog = new THREE.Fog(0x005577, -100, 1300);
  return scence;
};

/** 创建并添加光源 */
export const createLight = () => {
  // 环境光
  const ambientLight = new THREE.AmbientLight(0xffffff, 0.8);
  // 平行光
  const dirLight = new THREE.DirectionalLight(0xffffff, 1);
  dirLight.color.setHSL(.1, 1, 0.6);
  dirLight.position.set(-1, 1.75, 1);
  dirLight.position.multiplyScalar(30);

  return { ambientLight, dirLight };

};

/** 创建相机 */
export const createCamera = () => {
  const width = window.innerWidth;
  const height = window.innerHeight;
  const camera = new THREE.PerspectiveCamera(45, width / height, 1, 2000);
  //设置相机位置
  camera.position.set(200, 150, 200);
  //设置相机方向
  camera.lookAt(0, 0, 0);

  return camera;
};

/** 创建渲染器 */
export const createRenderer = () => {
  const width = window.innerWidth;
  const height = window.innerHeight;

  const renderer = new THREE.WebGLRenderer({
    antialias: true,
  });
  renderer.setClearColor(0x005577, 0.6);
  renderer.outputEncoding = THREE.sRGBEncoding;
  renderer.setSize(width, height);
  renderer.toneMapping = THREE.ACESFilmicToneMapping;

  return renderer;
};

/** 创建环境，天空、海水、太阳 */
export const initEnvironment = (scence, renderer) => {
  const sky = new Sky();
  sky.scale.setScalar(10000);
  const skyUniforms = sky.material.uniforms;
  skyUniforms['turbidity'].value = 20;
  skyUniforms['rayleigh'].value = 2;
  skyUniforms['mieCoefficient'].value = 0.005;
  skyUniforms['mieDirectionalG'].value = 0.8;

  const waterGeometry = new THREE.PlaneGeometry(10000, 10000);
  const water = new Water(waterGeometry, {
    textureWidth: 64,
    textureHeight: 64,
    waterNormals: new THREE.TextureLoader().load(waterTexture, texture => {
      texture.wrapS = texture.wrapT = THREE.RepeatWrapping;
    }),
    sunDirection: new THREE.Vector3(),
    sunColor: 0xffffff,
    waterColor: 0x0072ff,
    distortionScale: 4,
    fog: scence.fog !== undefined
  });
  water.rotation.x = - Math.PI / 2;
  water.position.y -= 20;

  const sun = new THREE.Vector3();
  const pmremGenerator = new THREE.PMREMGenerator(renderer);
  const phi = THREE.MathUtils.degToRad(88);
  const theta = THREE.MathUtils.degToRad(180);
  sun.setFromSphericalCoords(1, phi, theta);
  sky.material.uniforms['sunPosition'].value.copy(sun);
  water.material.uniforms['sunDirection'].value.copy(sun).normalize();
  scence.environment = pmremGenerator.fromScene(sky).texture;

  scence.add(water);
  scence.add(sky);
};


/** 让所有渲染器进行渲染 */
export const render = (renderersSet, scence, camera) => {
  renderersSet?.forEach((renderer) => {
    renderer.render(scence, camera);
  });
};


/** 导入GLTF文件 (默认文件自带材质路径，不去手动加载) */
export const loadGLTF = (scence, modelPath, options, callback) => {
  const loader = new THREE.ImageLoader();
  loader.setCrossOrigin('Anonymous'); // 解决跨域问题

  const gltfLoader = new GLTFLoader();
  gltfLoader.load(modelPath, (gltf) => {
    const model = gltf.scene;

    const x = options?.position?.x ?? 0,
      y = options?.position?.y ?? 0,
      z = options?.position?.z ?? 0;
    const scale = options?.scale ?? 1;

    model.position.set(x, y, z);
    model.position.set(scale, scale, scale);

    callback(gltf, model);
  });
};

/** 创建css2d渲染器 */
export const createCss2dRenderer = () => {
  const css2dRenderer = new CSS2DRenderer();
  css2dRenderer.setSize(window.innerWidth, window.innerHeight);
  css2dRenderer.domElement.style.position = 'absolute';
  css2dRenderer.domElement.style.top = '0px';
  css2dRenderer.domElement.style.pointerEvents = 'none';

  return css2dRenderer;
};

/** 导入css2d对象 */
export const loadCss2dObject = (scence, htmlContent, options) => {
  const el = document.createElement('div');
  el.innerHTML = `<div class="tag">${htmlContent}</div>`;

  const css2dObject = new CSS2DObject(el);
  css2dObject.position.set(
    options.position?.x || 0,
    options.position?.y || 0,
    options.position?.z || 0
  );

  scence.add(css2dObject);
  return css2dObject;
};

/** 创建动画效果，如火焰 */
export const createAnimation = (scence, texturePth, fragmentNum, options) => {
  const geometry = new THREE.PlaneGeometry(
    options.scale ?? 10,
    options.scale ?? 10
  );

  const textureLoader = new THREE.TextureLoader();
  const texture = textureLoader.load(texturePth);
  texture.repeat.set(1 / fragmentNum, 1);

  const material = new THREE.MeshBasicMaterial({
    map: texture,
    transparent: true,
    opacity: 0.7,
    depthWrite: false,
    side: THREE.DoubleSide
  });
  const mesh = new THREE.Mesh(geometry, material);
  const group = new THREE.Group();
  group.position.set(
    options.position?.x || 0,
    options.position?.y || 0,
    options.position?.z || 0
  );

  group.add(
    mesh,
    mesh.clone().rotateY(Math.PI / 2),
    mesh.clone().rotateY(Math.PI / 4),
    mesh.clone().rotateY((Math.PI / 4) * 3)
  );

  scence.add(group);

  let time = 0;
  /** 控制动画的更新，包括显示与否 */
  const updateAnimation = (isShow, options) => {
    if (isShow) {
      texture.offset.x = Math.floor((time += 0.1) % fragmentNum) / fragmentNum;
      group.position.set(
        options?.position?.x + 40 ?? 0,
        (options?.position?.y + 20) ?? 20,
        options?.position?.z ?? 0
      );
    } else {
      texture.offset.x = -1000;
      return;
    }
    window.requestAnimationFrame(() => updateAnimation(isShow, options));
  };
  return updateAnimation;
};

/** 添加控制，如鼠标操作等 */
export const createControls = (scence, camera, renderer, callback) => {
  const controls = new OrbitControls(camera, renderer.domElement);
  controls.addEventListener('change', () => {
    // renderer.render(scence, camera);
    callback?.(scence, camera);
  });
};

/** 射线点击，获取射线穿透的所有物体 */
export const get3dClickEventTargets = (scence, camera, event) => {
  const meshArr = [];
  const pointer = new THREE.Vector2();

  const raycaster = new THREE.Raycaster();
  pointer.x = (event.clientX / window.innerWidth) * 2 - 1;
  pointer.y = -(event.clientY / window.innerHeight) * 2 + 1;
  raycaster.setFromCamera(pointer, camera);

  scence.children?.forEach((child) => {
    if (child.isObject3D) {
      meshArr.push(child);
    }
  });

  const targets = raycaster.intersectObjects(meshArr);
  // callback?.(targets);
  return targets;
};