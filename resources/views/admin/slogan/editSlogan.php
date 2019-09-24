
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Sửa slogan</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
								<form data-vv-scope="uploadImage">
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Avatar</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('uploadImage.image')">{{errors.first('uploadImage.image')}}</div>
					                		<div v-if="!sloganEdit.showEditImage">
					                		<div  class="image">
					                			<img :src="sloganEdit.image" id="img" style="width: 100%;height: 100%;">
					                			<div @click="sloganEdit.showEditImage = !sloganEdit.showEditImage" class="edit-img">
						                			<i class="fa fa-pencil"></i>
						                		</div>
					                		</div>
					                		</div>

					                		<div v-if="sloganEdit.showEditImage" class="image">
					                			<img :src="sloganEdit.image" id="image-review" alt="" style="width: 100%;height: 100%;">
					                			<label for="image-edit" class="input-img">
													<b v-if="!sloganEdit.uploadImage">Chọn ảnh tải lên...</b>
													
												</label>
												<div @click="updateImage(sloganEdit)" v-if="sloganEdit.uploadImage" class="edit-img-check">
						                			<i class="fa fa-check"></i>
						                		</div>
											
												<input v-validate="'required|image'" @change="reviewImage(sloganEdit)" data-vv-name="image" type="file" id="image-edit" accept="image/*" style="display: none;">

												<div @click="hideEditImage(sloganEdit)" class="edit-img-times">
						                			<i class="fa fa-times"></i>
						                		</div>
						           
					                		</div>
					            
					                	</div>

				                	</div>
				                </div>
				                </form>
				                
				                <form data-vv-scope="sloganUpdate">
				                <div class="cc">
					                <div class="row">
					                	<label class="col-sm-2 col-sm-2 control-label">Tác giả</label>
						                <div class="col-sm-10">
						                	<div class="text-danger " v-if="errors.has('sloganUpdate.author')">{{errors.first('sloganUpdate.author')}}</div>
						                    <input v-validate="'required|max:30'" v-model="sloganEdit.author" type="text" data-vv-name="author" class="form-control">
						                </div>
					                </div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Mô tả</label>
					                	<div class="col-sm-10">
					                		<div class="text-danger " v-if="errors.has('sloganUpdate.description')">{{errors.first('sloganUpdate.description')}}</div>
					                		<input v-validate="'required'" v-model="sloganEdit.description" type="text" class="form-control" data-vv-name="description">
					                	</div>
				                	</div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Slogan</label>
				                		<div class="text-danger " v-if="errors.has('sloganUpdate.slogan')">{{errors.first('sloganUpdate.slogan')}}</div>
					                	<div class="col-sm-10">
					                		<input v-validate="'required|max:200'" v-model="sloganEdit.content" type="text" data-vv-name="slogan" class="form-control">
					                	</div>
					                </div>
				                </div>
				                <div class="act">
				                	<button @click="saveEdit(sloganEdit)" type="button" class="btn btn-primary">Lưu</button>
				                	<a href="/admin/slogan">
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

