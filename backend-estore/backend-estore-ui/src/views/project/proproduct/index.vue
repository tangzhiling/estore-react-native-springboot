<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类" prop="classifyId">
        <el-select v-model="queryParams.classifyId" placeholder="请选择">
          <el-option
            v-for="item in classifyList"
            :key="item.classifyId"
            :label="item.name"
            :value="item.classifyId">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="商品标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入商品标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['project:proproduct:add']"
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
          v-hasPermi="['project:proproduct:edit']"
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
          v-hasPermi="['project:proproduct:remove']"
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
          v-hasPermi="['project:proproduct:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="proproductList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="商品ID" align="center" prop="productId" />
      <!-- <el-table-column label="分类ID" align="center" prop="classifyId" /> -->
      <el-table-column label="分类名称" align="center" prop="classifyName" />
      <el-table-column label="商品标题" align="center" prop="title" />
      <el-table-column label="商品价格" align="center" prop="price" />
      <el-table-column label="封面" align="center" prop="image" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.image" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="轮播图" align="center" prop="image2s" />
      <el-table-column label="库存" align="center" prop="inventoryCount" />
      <el-table-column label="销量" align="center" prop="salesCount" />
      <el-table-column label="排序" align="center" prop="sort" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['project:proproduct:edit']"
            style="font-size: 14px; color: #67C23A;"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['project:proproduct:remove']"
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

    <!-- 添加或修改商品管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="所属分类" prop="classifyId">
          <el-select v-model="form.classifyId" placeholder="请选择">
            <el-option
              v-for="item in classifyList"
              :key="item.classifyId"
              :label="item.name"
              :value="item.classifyId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="商品标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入商品标题" />
        </el-form-item>
        <el-form-item label="商品价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入商品价格" />
        </el-form-item>
        <el-form-item label="封面" prop="image">
          <image-upload v-model="form.image" :limit='1'/>
        </el-form-item>
        <el-form-item label="轮播图" prop="image2s">
          <el-input v-model="form.image2s" placeholder="请输入轮播图" />
        </el-form-item>
        <el-form-item label="库存" prop="inventoryCount">
          <el-input-number v-model="form.inventoryCount" placeholder="请输入库存" />
        </el-form-item>
        <el-form-item label="销量" prop="salesCount">
          <el-input-number v-model="form.salesCount" placeholder="请输入销量" disabled/>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input-number v-model="form.sort" placeholder="请输入排序" />
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
import { listProproduct, getProproduct, delProproduct, addProproduct, updateProproduct,listProclassify } from "@/api/project/proproduct";

export default {
  name: "Proproduct",
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
      // 商品管理表格数据
      proproductList: [],
      //
      classifyList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        classifyId: null,
        title: null,
        price: null,
        image: null,
        image2s: null,
        inventoryCount: null,
        salesCount: null,
        sort: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        classifyId: [
          { required: true, message: "所属分类不能为空", trigger: "blur" }
        ],
        title: [
          { required: true, message: "商品标题不能为空", trigger: "blur" }
        ],
        price: [
          { required: true, message: "商品价格不能为空", trigger: "blur" }
        ],
        image: [
          { required: true, message: "封面不能为空", trigger: "blur" }
        ],
        image2s: [
          { required: true, message: "轮播图不能为空", trigger: "blur" }
        ],
        inventoryCount: [
          { required: true, message: "库存不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.handlistProclassify();
    this.getList();
  },
  methods: {
    /** 查询商品管理列表 */
    getList() {
      this.loading = true;
      listProproduct(this.queryParams).then(response => {
        this.proproductList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    /** 查询商品分类列表 */
    handlistProclassify() {
      listProclassify(this.queryParams).then(response => {
        this.classifyList = response.rows;
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
        productId: null,
        classifyId: null,
        title: null,
        price: null,
        image: null,
        image2s: null,
        inventoryCount: null,
        salesCount: null,
        createTime: null,
        sort: null
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
      this.ids = selection.map(item => item.productId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加商品管理";
      this.handlistProclassify();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const productId = row.productId || this.ids
      this.handlistProclassify();
      getProproduct(productId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改商品管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.productId != null) {
            updateProproduct(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProproduct(this.form).then(response => {
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
      const productIds = row.productId || this.ids;
      this.$modal.confirm('是否确认删除商品管理编号为"' + productIds + '"的数据项？').then(function() {
        return delProproduct(productIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('project/proproduct/export', {
        ...this.queryParams
      }, `proproduct_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
