<div id="app">
	<section id="main-content">
		<section class="wrapper">
			<div class="row mt">
				<div class="col-lg-12">
					<div class="content-panel">
						<h4> Thêm tài khoản Admin</h4>
						<section id="unseen">
							<div class="row">
								<div class="col-md-6 col-md-push-3">
													<div class="cc">
						               	<div class="row">
						               	 	<label class="col-sm-2 col-sm-2 control-label">Họ và tên</label>
							                <div class="col-sm-10">
																<input v-validate="'required|max:36'" data-vv-name="full_name" v-model="full_name" type="text" class="form-control">
																<div class="text-danger " v-if="errors.has('full_name')">{{errors.first('full_name')}}</div>
							                </div>
						               </div>
					                </div>

														<div class="cc">
							               	<div class="row">
							               	 	<label class="col-sm-2 col-sm-2 control-label">Email</label>
								                <div class="col-sm-10">
																	<input v-validate="'required|max:30'" data-vv-name="email" v-model="email" type="text" class="form-control">
																	<div class="text-danger " v-if="errors.has('email')">{{errors.first('email')}}</div>
								                </div>
							               </div>
						                </div>

															<div class="cc">
								               	<div class="row">
								               	 	<label class="col-sm-2 col-sm-2 control-label">Username</label>
									                <div class="col-sm-10">
																		<input v-validate="'required|max:30'" data-vv-name="username" v-model="username" type="text" class="form-control">
																		<div class="text-danger " v-if="errors.has('username')">{{errors.first('username')}}</div>
									                </div>
								               </div>
							                </div>

															<div class="cc">
								               	<div class="row">
								               	 	<label class="col-sm-2 col-sm-2 control-label">Mật khẩu</label>
									                <div class="col-sm-10">
																		<input v-validate="'required|max:30'" data-vv-name="password" v-model="password" type="password" class="form-control">
																		<div class="text-danger " v-if="errors.has('password')">{{errors.first('password')}}</div>
									                </div>
								               </div>
							                </div>

															<div class="cc">
									               	<div class="row">
									               	 	<label class="col-sm-2 col-sm-2 control-label">Xác nhận mật khẩu</label>
										                <div class="col-sm-10">
																			<input v-validate="'required|max:30'" data-vv-name="confirm_password" v-model="confirm_password" type="password" class="form-control">
																			<div class="text-danger " v-if="errors.has('confirm_password')">{{errors.first('confirm_password')}}</div>
										                </div>
									               </div>
								                </div>

					                <div class="act">
					                	<button @click="addAdmin" type="button" class="btn btn-primary">Thêm</button>
					                	<a href="/admin/administrator">
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
</div>
