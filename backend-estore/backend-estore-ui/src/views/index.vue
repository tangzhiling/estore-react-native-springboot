<template>
  <div class="home">
    <div class="header">
      <h1>欢迎进入后台管理系统</h1>
    </div>
    <div class="content">
      <p>一个简洁的后台管理系统可以帮助管理员高效地管理和控制网站或应用程序的后台功能，提升工作效率和用户体验。</p>
      <img src="../assets/logo/logo.png" alt="Logo" class="logo-image">
    </div>
    <div class="footer">
      <p>&copy;  My Website. All rights reserved.</p>
    </div>
  </div>
</template>
<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.6"
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    }
  }
};
</script>

<style scoped>
.home {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f5f5f5;
}

.header {
  text-align: center;
  margin-bottom: 20px;
}

.content {
  text-align: center;
  margin-bottom: 40px;
}

.logo-image {
  width: 200px;
  height: auto;
}


.cta-button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.footer {
  text-align: center;
  font-size: 12px;
  color: #888;
}
</style>
