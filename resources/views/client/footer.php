<!-- start footer Area -->		
			<footer class="footer-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-3  col-md-12">
							<div class="single-footer-widget">
								<h6>Menu</h6>
								<ul class="footer-nav">
									<li><a href="/">Trang chủ</a></li>
									<li><a href="/cau-hoi">Câu hỏi</a></li>
									<li><a href="/tin-tuc">Tin tức</a></li>
									<li><a href="/gioi-thieu">Giới thiệu</a></li>
									<li><a href="/lien-he">Liên hệ</a></li>

								</ul>
							</div>
						</div>
						<div class="col-lg-6  col-md-12">
							<div class="single-footer-widget newsletter">
								<h6>Đơn vị</h6>
								<p>Lớp KTPM3-K11 Khoa Công Nghệ Thông Tin</p>
								<p>Trường đại học Công Nghiệp Hà Nội</p>
								<div id="mc_embed_signup">
									<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

										<div class="form-group row" style="width: 100%">
											<div class="col-lg-8 col-md-12">
												<input name="EMAIL" placeholder="Tin nhắn" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">
												<div style="position: absolute; left: -5000px;">
													<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
												</div>
											</div> 
										
											<div class="col-lg-4 col-md-12">
												<button class="nw-btn primary-btn">Gửi<span class="lnr lnr-arrow-right"></span></button>
											</div> 
										</div>		
										<div class="info"></div>
									</form>
								</div>		
							</div>
						</div>
						<div class="col-lg-3  col-md-12">
							

							<div class="single-footer-widget">
								<h6>Giảng viên hướng dẫn</h6>
								<ul class="footer-nav">
									<li><a href="https://www.facebook.com/profile.php?id=100008363386568">Ths. Hoàng Quang Huy</a></li>
								</ul>
							</div>
							<div class="single-footer-widget">
								<h6>Thành viên</h6>
								<ul class="footer-nav">
									<li><a href="/gioi-thieu">Trần Viết Trưởng, Vũ Ngọc Đức Long, Đoàn Quang Nhật</a></li>
									<!-- <li><a href="#">Vũ Ngọc Đức Long</a></li>
									<li><a href="#">Đoàn Quang Nhật</a></li> -->
								</ul>
							</div>
						</div>						
					</div>

					<div class="row footer-bottom d-flex justify-content-between">
						<p class="col-lg-8 col-sm-12 footer-text m-0 text-white">
							Bài tập lớn môn học phát triển phầm mềm hướng dịch vụ 
							<i class="fa fa-heart-o" aria-hidden="true"></i>
						</p>
						<div class="col-lg-4 col-sm-12 footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	
			<!-- End footer Area -->		
			
			
			<script src="public/client/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="public/client/js/vendor/bootstrap.min.js"></script>	

			<script src="https://cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
			

			<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
  			<script src="public/client/js/easing.min.js"></script>			
			<script src="public/client/js/hoverIntent.js"></script>
			<script src="public/client/js/superfish.min.js"></script>	
			<script src="public/client/js/jquery.ajaxchimp.min.js"></script>
			<script src="public/client/js/jquery.magnific-popup.min.js"></script>	
			<script src="public/client/js/owl.carousel.min.js"></script>			
			<script src="public/client/js/jquery.sticky.js"></script>
			<script src="public/client/js/jquery.nice-select.min.js"></script>			
			<script src="public/client/js/parallax.min.js"></script>		
			<script src="public/client/js/mail-script.js"></script>
			

			<script src="public/admin/vue.js"></script>
			<script src="public/admin/vuejs-paginate.js"></script>
			<script src="public/admin/vee-validate.js"></script>
			<script src="public/admin/axios.min.js"></script>
			<script src="public/admin/sweetalert.js"></script>
			<script src="public/admin/vue-tags-input.js"></script>
			
			<script src="public/client/js/main.js"></script>
			<?php if(isset($this->js)) echo $this->js; ?>

			<style>
				.swal2-select {
				    display: none !important;
				}
			</style>
			

			<script>
				CKEDITOR.replace( 'editor1' );
			</script>

			<script>

				jQuery(document).ready(function($) {
					if(document.getElementById("default-select")){
						$('#select').niceSelect('update');
					};
				});



				function share(url)
				{
					Swal.fire({
						input: 'text',
						inputValue: url,
						inputAttributes: {
							readonly: false,
						},
						showConfirmButton: false
					})
				}
			</script>

			<script>
				$('#species').change(function(event) {
					if($(this).val() == 'news')
					{
						$('#category').removeAttr('name');
						$("#form-search").attr('action','/tim-kiem/tin-tuc');
					}
					else
					{
						$('#category').attr('name','cate');
						$("#form-search").attr('action','/tim-kiem/cau-hoi');
					}
				});
			</script>
		</body>
	</html>