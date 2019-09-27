
<section class="contact-page-area section-gap" id="register">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-area"  >
					<div class="row">
						<div class="col-lg-6 offset-3 form-group">
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-star"></i></div>
								<input type="text" v-validate="'required|max:30|min:2'" data-vv-name="full_name" placeholder="Họ và tên" class="single-input form-control">
								<div class="text-danger " v-if="errors.has('full_name')">{{errors.first('full_name')}}</div>
							</div>

							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-envelope"></i></div>
								<input type="text" data-vv-name="email" v-validate="'required|email'" placeholder="Email" class="single-input form-control">
								<div class="text-danger " v-if="errors.has('email')">{{errors.first('email')}}</div>
							</div>

							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-briefcase"></i></div>
								<div class="form-select" id="default-select">
									<select data-vv-name="major" v-validate="'required'">
										<option value="null">Lĩnh vực</option>
										<?php foreach ($this->catagories as $catagory) { ?>
											<option value="<?php echo $catagory['name'] ?>"><?php echo $catagory['name'] ?></option>
										<?php } ?>
									</select>
									<div class="text-danger " v-if="errors.has('major')">{{errors.first('major')}}</div>
								</div>
							</div>
							
							<div class="input-group-icon mt-10" style="margin-top: 30px;">
								<div class="icon"><i class="fa fa-user"></i></div>
								<input v-validate="'required|max:30|min:3'" type="text" data-vv-name="username" placeholder="Tên tài khoản" class="single-input form-control">
								<div class="text-danger " v-if="errors.has('username')">{{errors.first('username')}}</div>
							</div>
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
								<input v-validate="'required|'" type="text" data-vv-name="password" placeholder="Mật khẩu" required class="single-input form-control">
							</div>

							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
								<input type="text" data-vv-name="repassword" placeholder="Nhập lại mật khẩu" required class="single-input form-control">
							</div>
							
							<button  class="primary-btn mt-20 text-white">Đăng Ký</button>
							<div class="mt-20 alert-msg" style="text-align: left;"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>	
</section>

