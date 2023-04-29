<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import routes from "@/router/route";
export default {
  data() {
    return {
      routes,
    };
  },
  mounted() {
    // console.log(this.$route.path);
  },
  computed: {
    isActive() {
      return this.$route.path == "/echartsmessage";
    },
  },
};
</script>

<style lang="less" scoped>
.el-header {
  padding: 0;
}

.active {
  background: url(@/assets/images/bg.jpg) no-repeat top center;
}
</style>
