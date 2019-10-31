<section class="contact-page-area section-gap" id="login">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-area " class="contact-form text-right">
					<div class="row">	
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 offset-md-3 form-group">
							<div class="my-post">
								<h4 class="text-center mb-4"> Đăng Nhập </h4>
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-user" aria-hidden="true"></i></div>
									<input v-model="username" v-validate="'required'" type="text" data-vv-name="username" placeholder="Tài khoản" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tài Khoản'" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('username')">{{errors.first('username')}}</div>
								</div>
								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-lock" aria-hidden="true"></i></div>
									<input v-model="password" v-validate="'required'" type="password" data-vv-name="password" placeholder="Mật khẩu" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Mật khẩu'" class="single-input form-control">
									<div class="text-danger " v-if="errors.has('password')">{{errors.first('password')}}</div>
								</div>

								<div class="forget-password" @click="forgetPass">
									<span class="text-primary" style="cursor: pointer;">Quên mật khẩu ?</span>
								</div>

								<button @click="login" type="button" class="primary-btn mt-20 text-white">Đăng Nhập</button>
								<p class="text-center mt-5">Bạn chưa có tài khoản? <a href="/dang-ky">Đăng ký tại đây</a></p>
								<div class="mt-20 alert-msg" style="text-align: left;"></div>
							</div>
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>	
</section>
			<!-- End contact-page Area -->