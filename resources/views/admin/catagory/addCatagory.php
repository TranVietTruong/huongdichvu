<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Thêm danh mục</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
			
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Ảnh danh mục</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('image')">{{errors.first('image')}}</div>
					                		<input v-validate="'required|image'" data-vv-name="image" id="image" type="file" class="form-control">
					                	</div>
				                	</div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Tên danh mục</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('name')">{{errors.first('name')}}</div>
					                		<input v-validate="'required|max:200'" v-model="name" data-vv-name="name" type="text" class="form-control">
					                	</div>
				                	</div>
				                </div>
				                <div class="act">
				                	<button @click="addCatagory"  type="button" class="btn btn-primary">Thêm</button>
				                	<a href="/admin/catagory">
				                		<button type="button" class="btn btn-danger">Hủy</button>
				                	</a>
				                
				                </div>
				          
							</div>
						</div>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>
