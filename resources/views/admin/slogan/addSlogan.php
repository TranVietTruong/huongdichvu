<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Thêm slogan</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
								<div class="cc">
					               	<div class="row">
					               	 	<label class="col-sm-2 col-sm-2 control-label">Tác giả</label>
						                <div class="col-sm-10">
						                	<div class="text-danger " v-if="errors.has('author')">{{errors.first('author')}}</div>
						                    <input v-validate="'required|max:30'" data-vv-name="author" v-model="author" type="text" class="form-control">

						                </div>
					               </div>
				                </div>
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Avatar</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('image')">{{errors.first('image')}}</div>
					                		<input v-validate="'required|image'" data-vv-name="image" id="image" type="file" class="form-control">
					                	</div>
				                	</div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Mô tả</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('description')">{{errors.first('description')}}</div>
					                		<input v-validate="'required|max:200'" v-model="description" data-vv-name="description" type="text" class="form-control">
					                	</div>
				                	</div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Slogan</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('slogan')">{{errors.first('slogan')}}</div>
					                		<input data-vv-name="slogan" v-validate="'required'" v-model="slogan" type="text" class="form-control">
					                	</div>
				                	</div>
				                </div>
				                <div class="act">
				                	<button @click="addSlogan" type="button" class="btn btn-primary">Thêm</button>
				                	<a href="/admin/slogan">
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
