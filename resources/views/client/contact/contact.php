<!-- Start contact-page Area -->
<section class="contact-page-area section-gap">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 d-flex flex-column">
				<a class="contact-btns" href="#">Ý kiến đóng góp</a>
				<a class="contact-btns" href="#">Phản mồi</a>
				<a class="contact-btns" href="#">Ý tưởng</a>
			</div>
			<div class="col-lg-8">
				<form class="form-area " id="myForm" action="mail.php" method="post" class="contact-form text-right">
					<div class="row">	
						<div class="col-lg-12 form-group">
							<input name="name" placeholder="Họ tên" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Họ tên'" class="common-input mb-20 form-control" required="" type="text">

							<input name="email" placeholder="Email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" class="common-input mb-20 form-control" required="" type="email">

							<input name="subject" placeholder="Tiêu đề" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Tiêu đề'" class="common-input mb-20 form-control" required="" type="text">
							<textarea class="common-textarea mt-10 form-control" name="message" placeholder="Nội dung" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nội dung'" required=""></textarea>
							<button class="primary-btn mt-20 text-white" style="float: right;">Gửi</button>
							<div class="mt-20 alert-msg" style="text-align: left;"></div>
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>	
</section>
<!-- End contact-page Area -->
