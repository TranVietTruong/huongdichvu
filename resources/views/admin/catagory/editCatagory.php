<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Thêm danh mục</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
			
				                <form data-vv-scope="uploadImage">
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Avatar</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('uploadImage.image')">{{errors.first('uploadImage.image')}}</div>
					                		<div v-if="!catagoryEdit.showEditImage">
					                		<div  class="image">
					                			<img :src="catagoryEdit.image" id="img" style="width: 100%;height: 100%;">
					                			<div @click="catagoryEdit.showEditImage = !catagoryEdit.showEditImage" class="edit-img">
						                			<i class="fa fa-pencil"></i>
						                		</div>
					                		</div>
					                		</div>

					                		<div v-if="catagoryEdit.showEditImage" class="image">
					                			<img :src="catagoryEdit.image" id="image-review" alt="" style="width: 100%;height: 100%;">
					                			<label for="image-edit" class="input-img">
													<b v-if="!catagoryEdit.uploadImage">Chọn ảnh tải lên...</b>
													
												</label>
												<div @click="updateImage(catagoryEdit)" v-if="catagoryEdit.uploadImage" class="edit-img-check">
						                			<i class="fa fa-check"></i>
						                		</div>
											
												<input v-validate="'required|image'" @change="reviewImage(catagoryEdit)" data-vv-name="image" type="file" id="image-edit" accept="image/*" style="display: none;">

												<div @click="hideEditImage(catagoryEdit)" class="edit-img-times">
						                			<i class="fa fa-times"></i>
						                		</div>
						           
					                		</div>
					            
					                	</div>

				                	</div>
				                </div>
				                </form>
								<form data-vv-scope="updateName">
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Tên danh mục</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('updateName.name')">{{errors.first('updateName.name')}}</div>
					                		<input v-validate="'required|max:200'" v-model="catagoryEdit.name" data-vv-name="name" type="text" class="form-control">
					                	</div>
				                	</div>
				                </div>
				                <div class="act">
				                	<button @click="editCatagory(catagoryEdit)"  type="button" class="btn btn-primary">Lưu</button>
				                	<a href="/admin/catagory">
				                		<button type="button" class="btn btn-danger">Hủy</button>
				                	</a>
				                
				                </div>
				          		</form>
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
