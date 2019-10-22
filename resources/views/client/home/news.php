<!-- Start download Area -->
<section class="download-area section-gap">
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
						<a href="tin-tuc/<?php echo $new['slug']?>"><img class="img-fluid" src="<?php echo $new['image']?>" alt=""></a>
					</div>
					<div class="new-content">
						<a href="tin-tuc/<?php echo $new['slug']?>">
							<h4 class="title"><?php echo $new['title']?></h4>
						</a>
						
						<div class="time">
							<span><i class="far fa-calendar-alt"></i></span>
							Ngày đăng: 
							<span class="text-primary"><?php echo $new['time']?></span>
						</div>
						<div class="read-more">
							<a href="tin-tuc/<?php echo $new['slug']?>" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
			</div>	
			<?php } ?>
		</div>
	</div>	
</section>
			<!-- End download Area -->