<section class="contact-page-area section-gap" id="login">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-area " class="contact-form text-right">
					<div class="row">	
						<div class="col-lg-6 offset-3 form-group">
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

							<div class="forget-password">
								<a href="">Quên mật khẩu ?</a>
							</div>

							<button @click="login" type="button" class="primary-btn mt-20 text-white">Đăng Nhập</button>
							<div class="mt-20 alert-msg" style="text-align: left;"></div>
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>	
</section>
			<!-- End contact-page Area -->