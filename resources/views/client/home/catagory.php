<!-- Start feature-cat Area -->
<section class="feature-cat-area pt-100" id="category">
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="menu-content pb-60 col-lg-10">
				<div class="title text-center">
					<h1 class="mb-10">Lĩnh Vực</h1>
					
				</div>
			</div>
		</div>						
		<div class="row">
			<?php foreach ($this->catagories as $catagory) { ?>
			<div class="col-lg-2 col-md-4 col-sm-6">
				<div class="single-fcat">
					<a href="/linh-vuc/<?php echo $catagory['slug'] ?>">
						<img src="<?php echo $catagory['image']?>" alt="">
					</a>
					<p><?php echo $catagory['name']?></p>
				</div>
			</div>	
			<?php } ?>																								
		</div>
	</div>	
</section>
			<!-- End feature-cat Area -->