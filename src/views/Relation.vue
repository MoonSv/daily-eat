<template>
  <div style="width: 100%;">
    <div class="search-input">
      <el-autocomplete
        class="inline-input"
        v-model="name"
        :fetch-suggestions="querySearch"
        placeholder="输入小朋友姓名"
        :trigger-on-focus="false"
        @select="handleSelect"
      >
        <el-button slot="append" icon="el-icon-search" @click="clickSearch"></el-button>
      </el-autocomplete>
    </div>
    <div v-if="isShowResult" class="result-table">
      <el-table :data="resultTable" style="width: 100%">
        <el-table-column prop="value" label="Name" width="130"></el-table-column>
        <el-table-column prop="relation" label="Relation" width="150"></el-table-column>
        <el-table-column prop="address" label="Location"></el-table-column>
        <el-table-column prop="tag" label="Tags" width="250">
          <template slot-scope="scope">
            <el-tag
              v-for="(tag, index) in scope.row.tag"
              style="margin-right: 5px; margin-bottom: 5px"
              :key="index"
              disable-transitions
            >{{tag}}</el-tag>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
export default {
  name: "Relation",
  components: {
  },
  props: {
    msg: String
  },
  data() {
    return {
      relations: [],
      resultTable: [],
      state1: "",
      name: "",
      isShowResult: false
    };
  },
  created() {
    this.relations = this.loadAll();
  },
  methods: {
    querySearch(queryString, cb) {
      var relations = this.relations;
      var results = queryString
        ? relations.filter(this.createFilter(queryString))
        : relations;
      // 调用 callback 返回建议列表的数据
      cb(results);
    },
    createFilter(queryString) {
      return relation => {
        return (
          relation.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    loadAll() {
      return [
        {
          value: "牛牛",
          nickname: "",
          address: "悉尼",
          relation: "初中同学",
          tag: ["微胖"]
        },
        {
          value: "女博士",
          nickname: "",
          address: "南京",
          relation: "初中同学",
          tag: ["微胖"]
        },
        {
          value: "Wendy",
          nickname: "",
          address: "无锡",
          relation: "WX同事",
          tag: ["类人事工作", "喜爱香氛"]
        },
        {
          value: "Liz",
          nickname: "栗子",
          address: "上海",
          relation: "SH同事",
          tag: ["不知道"]
        },
        {
          value: "Test",
          nickname: "test",
          address: "test",
          relation: "test",
          tag: ["不知道"]
        }
      ];
    },
    handleSelect(item) {
      this.isShowResult = true;

      let name = item.value.toLowerCase();
      this.relations.forEach(relation => {
        if (
          relation.value.toLowerCase() === name ||
          relation.nickname.toLowerCase() === name
        ) {
          console.log(relation);
          this.resultTable = [];
          this.resultTable.push(relation);
        }
      });
    },
    clickSearch() {
      this.isShowResult = true;
      let name = this.value.toLowerCase();
      this.relations.forEach(relation => {
        if (
          relation.value.toLowerCase() === name ||
          relation.nickname.toLowerCase() === name
        ) {
          console.log(relation);
          this.resultTable = [];
          this.resultTable.push(relation);
        }
      });
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.search-input {
  width: 255px;
  margin: 20px auto;
}
.result-table {
  margin: 70px auto 0;
  width: 50%;
}
</style>
