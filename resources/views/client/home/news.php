<!-- Start download Area -->
<section class="download-area section-gap" id="app">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-60 col-lg-10">
				<div class="title text-center">
					<h1 class="mb-10">Tin Tức</h1>
					
				</div>
			</div>
		</div>	
		<div class="row">
			<?php foreach ($this->news as $new) { ?>
			<div class="col-md-4 mb-3">
				<div class="single-new">
					<div class="thumbail">
						<a href=""><img class="img-fluid" src="<?php echo $new['image']?>" alt=""></a>
					</div>
					<div class="new-content">
						<a href="">
							<h4 class="title"><?php echo $new['title']?></h4>
						</a>
						
						<div class="time">
							<span><i class="far fa-calendar-alt"></i></span>
							Ngày đăng: 
							<span class="text-primary"><?php echo $new['time']?></span>
						</div>
						<div class="read-more">
							<a target="_blank" href="https://khoinghiep.org.vn/khoi-nghiep-tu-lo-dao-tao-17118.html" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
			</div>	
			<?php } ?>
		</div>
	</div>	
</section>
			<!-- End download Area -->