
<section class="contact-page-area section-gap" id="register">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-area"  >
					<div class="row">
						
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 offset-md-3 form-group">
							<div class="fly">
								<img src="https://cdn.sstatic.net/Img/home/accelerate.svg?v=9d4c2786ff02" alt="">
							</div>
							<div class="my-post">
								<h4 class="text-center mb-4"> Đăng Ký </h4>

								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-star"></i></div>
									<input v-model="full_name" type="text" v-validate="'required|max:30|min:2'" data-vv-name="full_name" placeholder="Họ và tên" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('full_name')">{{errors.first('full_name')}}</div>
								</div>

								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-envelope"></i></div>
									<input v-model="email" type="text" data-vv-name="email" v-validate="'required|email'" placeholder="Email" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('email')">{{errors.first('email')}}</div>
								</div>

								<div class="input-group-icon mt-10" style="margin-top: 30px;">
									<div class="icon"><i class="fa fa-user"></i></div>
									<input v-model="username" v-validate="'required|max:30|min:3'" type="text" data-vv-name="username" placeholder="Tên tài khoản" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('username')">{{errors.first('username')}}</div>
								</div>
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
									<input v-model="password" v-validate="'required|min:3'" type="password" data-vv-name="password" placeholder="Mật khẩu" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('password')">{{errors.first('password')}}</div>
								</div>

								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
									<input v-model="repassword" v-validate="{required:true,is:password}"type="password" data-vv-name="repassword" placeholder="Nhập lại mật khẩu" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('repassword')">{{errors.first('repassword')}}</div>
								</div>
								<div class="g-recaptcha" data-sitekey="6LcSgb0UAAAAAKN9tJ0LXQQO4GDeKLQhfNFum9yp"></div>
								<div class="text-danger " v-if="errorCaptcha">{{errorCaptcha}}</div>


								<button @click="register" type="button"  class="primary-btn mt-20 text-white">Đăng Ký</button>
								<p class="text-center mt-5">Tôi đã có tài khoản? <a href="/dang-nhap">Đăng nhập</a></p>
								<div class="mt-20 alert-msg" style="text-align: left;"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>	
</section>

