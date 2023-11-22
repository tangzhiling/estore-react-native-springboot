<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="使用状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择使用状态" clearable>
          <el-option
            v-for="dict in dict.type.pro_coupon_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="优惠卷类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择" clearable>
          <el-option
            v-for="dict in dict.type.pro_coupon_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['project:procoupon:add']"
          style="font-size: 14px; color: blue;"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['project:procoupon:edit']"
          style="font-size: 14px; color: #67C23A;"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['project:procoupon:remove']"
          style="font-size: 14px; color: #F56C6C;"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['project:procoupon:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="procouponList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="券码序列号" align="center" prop="id" />
      <!-- <el-table-column label="发放用户" align="center" prop="userId" /> -->
      <!-- <el-table-column label="发放用户" align="center" prop="nickN" /> -->
      <el-table-column label="优惠卷类型" align="center" prop="type" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pro_coupon_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="折扣金额/则扣比例" align="center" prop="discount"/>
    
      <el-table-column label="需满足价格" align="center" prop="condition" />
      <el-table-column label="生效时间" align="center" prop="activeTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.activeTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="过期时间" align="center" prop="expiredTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.expiredTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="生效商品ID" align="center" prop="range" /> -->
      <el-table-column label="使用状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.pro_coupon_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['project:procoupon:edit']"
            style="font-size: 14px; color: #67C23A;"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:procoupon:remove']"
            style="font-size: 14px; color: #F56C6C;"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改优惠卷管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户ID" prop="userId">
          <el-select v-model="form.userId" placeholder="请选择">
            <el-option
              v-for="item in userList"
              :key="item.userId"
              :label="item.nickName"
              :value="item.userId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="优惠卷类型" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio
              v-for="dict in dict.type.pro_coupon_type"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="折扣金额/则扣比例" prop="discount">
          <el-input v-model="form.discount" placeholder="固定金额填写数额倍率折扣则填写小于1的浮点数" />
        </el-form-item>
        <el-form-item label="需满足价格" prop="condition">
          <el-input v-model="form.condition" placeholder="请输入需满足价格" />
        </el-form-item>
        <el-form-item label="生效时间" prop="activeTime">
          <el-date-picker clearable
            v-model="form.activeTime"
            type="datetime"
            placeholder="请选择生效时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="过期时间" prop="expiredTime">
          <el-date-picker clearable
            v-model="form.expiredTime"
            type="datetime"
            placeholder="请选择过期时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="关联的产品" prop="range">
          <el-select v-model="form.range" multiple placeholder="请选择">
            <el-option
              v-for="item in productList"
              :key="item.productId"
              :label="item.title"
              :value="item.productId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="使用状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio
              v-for="dict in dict.type.pro_coupon_status"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listProcoupon, getProcoupon, delProcoupon, addProcoupon, updateProcoupon,listProUser,listProproduct} from "@/api/project/procoupon";

export default {
  name: "Procoupon",
  dicts: ['pro_coupon_status', 'pro_coupon_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 优惠卷管理表格数据
      procouponList: [],
      //
      userList: [],
      ///
      productList:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        status: null,
        type: null,
        discount: null,
        condition: null,
        activeTime: null,
        expiredTime: null,
        range: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        type: [
          { required: true, message: "优惠卷类型不能为空", trigger: "change" }
        ],
        discount: [
          { required: true, message: "打折比例/则扣金额不能为空", trigger: "blur" }
        ],
        condition: [
          { required: true, message: "需满足价格不能为空", trigger: "blur" }
        ],
        activeTime: [
          { required: true, message: "生效时间，如果未达到则不可用不能为空", trigger: "blur" }
        ],
        expiredTime: [
          { required: true, message: "过期时间不能为空", trigger: "blur" }
        ],
        range: [
          { required: true, message: "用于生效的商品不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.handlistProproduct();
    this.handlistProUser();
    this.getList();
  },
  methods: {
    /** 查询优惠卷管理列表 */
    getList() {
      this.loading = true;
      listProcoupon(this.queryParams).then(response => {
        this.procouponList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 查询用户列表 */
    handlistProUser() {
      listProUser(this.queryParams).then(response => {
        this.userList = response.rows;
      });
    },

    /** 查询商品管理列表 */
    handlistProproduct() {
      var map  = {};
      listProproduct(map).then(response => {
        this.productList = response.rows;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        status: null,
        type: null,
        discount: null,
        condition: null,
        activeTime: null,
        expiredTime: null,
        range: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
    this.handlistProproduct();
      this.open = true;
      this.title = "添加优惠卷管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.handlistProproduct();
      const id = row.id || this.ids
      getProcoupon(id).then(response => {
        this.form = response.data;
        let range = this.form.range;
        if(range!=null&&range!=""){
          let ranges =  range.split(',')
          this.form.range = ranges.map(item =>Number(item));
        }
        this.open = true;
        this.title = "修改优惠卷管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            this.form.range = this.form.range+'';
            console.log(this.form.range);
            updateProcoupon(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.range = this.form.range+'';
            console.log(this.form.range);
            addProcoupon(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除优惠卷管理编号为"' + ids + '"的数据项？').then(function() {
        return delProcoupon(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('project/procoupon/export', {
        ...this.queryParams
      }, `procoupon_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
