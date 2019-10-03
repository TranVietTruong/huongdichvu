<!-- Start popular-post Area -->
<section class="popular-post-area pt-100">
	<div class="container">
		<div class="row align-items-center">
			<div class="active-popular-post-carusel">

				<?php foreach ($this->slogans as $slogan) {   ?>
				<div class="single-popular-post">
					<div class="row">
						<div class="col-md-2 col-sm-6 col-xs-12">
							<div class="thumb">
								<img class="img-fluid" src="<?php echo $slogan['image'] ?>" alt="">
							</div>
						</div>
						<div class="col-md-10 col-sm-6 col-xs-12">
							<div class="details">
								<a href="#"><h4><?php echo $slogan['author']?></h4></a>
								<h6><?php echo $slogan['description']?></h6>
								<p>
									<?php echo $slogan['content']?>
								</p>
							</div>
						</div>
					</div>
					
					
				</div>																							
				<?php } ?>											
			</div>
		</div>
	</div>	
</section>
			<!-- End popular-post Area -->