<template>
  <div class="wrapper">
    <div class="routes">
      <RouterLink v-for="i in routes" :key="i.path" :to="i.path">
        {{ i.name }}
      </RouterLink>
    </div>
    <router-view></router-view>
  </div>
</template>

<script>
import routes from "@/router/route";

export default {
  name: "App",
  components: {},
  data() {
    return {
      routes,
    };
  },
};
</script>

<style scoped lang="less">
html,
body,
h5,
div {
  margin: 0;
  padding: 0;
}

.routes {
  position: absolute;
  bottom: 0;
  width: 100%;
  display: flex;
  justify-content: center;
  gap: 10px;
  z-index: 999;
  background: url("@/assets/images/head_bg.png");
  a {
    color: #fff;
    text-decoration: none;
    border-radius: 20px;
    padding: 10px;
  }
  a:active {
    color: aquamarine;
  }
}
</style>
