<template>
  <div style="padding-top: 10px;">
    <!-- <div class="title">test</div> -->
    <div class="title">What We Eat In A Day</div>
    <el-container style="padding: 0 20px; height: 100%">
      <!-- <el-aside class="aside">{{current_date}}</el-aside> -->
      <el-main>
        <el-row :gutter="20">
          <el-col :xs="24" :sm="6" :md="4" :lg="11" :xl="11">
            <el-card class="unit-card">
              <div slot="header" class="clearfix">
                <span class="name">77</span>
                <el-button style="float: right; padding: 3px 0" type="text">edit</el-button>
              </div>
              <el-form ref="mine_form" :model="mine_form" label-width="80px">
                <el-form-item label="Normal">
                  <el-checkbox-group v-model="mine_form.type">
                    <el-checkbox label="Tea" name="type"></el-checkbox>
                    <el-checkbox label="Milk/Yogurt" name="type"></el-checkbox>
                    <el-checkbox label="Egg" name="type"></el-checkbox>
                    <el-checkbox label="Coffee" name="type"></el-checkbox>
                    <el-checkbox label="Rice" name="type"></el-checkbox>
                    <el-checkbox label="Noodle" name="type"></el-checkbox>
                    <el-checkbox label="Nut" name="type"></el-checkbox>
                  </el-checkbox-group>
                </el-form-item>
                <el-form-item label="Meat">
                  <el-select multiple v-model="mine_form.meat" placeholder="meat type">
                    <el-option label="Beef" value="Beef"></el-option>
                    <el-option label="Chicken" value="Chicken"></el-option>
                    <el-option label="Fish" value="Fish"></el-option>
                    <el-option label="Mutton" value="Mutton"></el-option>
                    <el-option label="Pork" value="Pork"></el-option>
                    <el-option label="Duck" value="Duck"></el-option>
                  </el-select>
                </el-form-item>
              </el-form>
            </el-card>
          </el-col>
          <el-col :xs="24" :sm="6" :md="4" :lg="11" :xl="11">
            <el-card class="unit-card">
              <div slot="header" class="clearfix">
                <span class="name">Zoe</span>
                <el-button style="float: right; padding: 3px 0" type="text">edit</el-button>
              </div>
              <el-form ref="zoe_form" :model="zoe_form" label-width="80px">
                <el-form-item label="Normal">
                  <el-checkbox-group v-model="zoe_form.type">
                    <el-checkbox label="Tea" name="type"></el-checkbox>
                    <el-checkbox label="Milk/Yogurt" name="type"></el-checkbox>
                    <el-checkbox label="Egg" name="type"></el-checkbox>
                    <el-checkbox label="Coffee" name="type"></el-checkbox>
                    <el-checkbox label="Rice" name="type"></el-checkbox>
                    <el-checkbox label="Noodle" name="type"></el-checkbox>
                    <el-checkbox label="Nut" name="type"></el-checkbox>
                  </el-checkbox-group>
                </el-form-item>
                <el-form-item label="Meat">
                  <el-select multiple v-model="zoe_form.meat" placeholder="meat type">
                    <el-option label="Beef" value="Beef"></el-option>
                    <el-option label="Chicken" value="Chicken"></el-option>
                    <el-option label="Fish" value="Fish"></el-option>
                    <el-option label="Mutton" value="Mutton"></el-option>
                    <el-option label="Pork" value="Pork"></el-option>
                    <el-option label="Duck" value="Duck"></el-option>
                  </el-select>
                </el-form-item>
              </el-form>
            </el-card>
          </el-col>
        </el-row>
        <el-row>
          <!-- <router-link to="/relation"> -->
            <el-link type="info" @click="jumpTo()">77 private link</el-link>
          <!-- </router-link> -->
        </el-row>
      </el-main>
    </el-container>
    <el-footer class="footer">©77&Zoe copy right</el-footer>
  </div>
</template>

<script>
// import Relations from "../views/Relations";
export default {
  name: "Home",
  components: {
    // Relations
  },
  props: {
    msg: String
  },
  data() {
    return {
      mine_form: {
        meat: [],
        veg: [],
        type: [],
        resource: ""
      },
      zoe_form: {
        meat: [],
        veg: [],
        type: [],
        resource: ""
      },
      current_date: ""
    };
  },
  created() {
    this.getCurrentDate();
  },
  methods: {
    getCurrentDate: function() {
      let fullDate = new Date();
      let year = fullDate.getFullYear();
      let month = fullDate.getMonth() + 1;
      let date = fullDate.getDate();
      this.current_date = `${year}-${month}-${date}`;
      return `${year} - ${month} - ${date}`;
    },
    jumpTo: function() {
      console.log("123");
      this.$router.push('/relation')
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.title {
  text-align: center;
  color: #ffffff;
  font-size: 25px;
  font-weight: 900;
  margin: 0 auto 0;
  width: 300px;
  padding: 10px;
  border-radius: 7px;
  background-color: #88c7ad;
  box-shadow: 0 0 10px #b9b9b9;
  transition: all 0.2s;
}
.title:hover {
  background-color: #8988c7;
  color: rgb(247, 217, 174);
  box-shadow: 0 0 10px #848484;
}
.el-col {
  margin: 10px 0;
}
.name {
  color: #93bbae;
  font-weight: 900;
}
.unit-card {
  min-height: 500px;
}
.footer {
  position: fixed;
  text-align: center;
  bottom: 0px;
  width: 100%;
  color: #fff;
  padding-top: 15px;
  background-color: rgb(51, 48, 48);
  z-index: 99;
}
.aside {
  font-weight: 700;
  color: #6d6d6d;
}
</style>
