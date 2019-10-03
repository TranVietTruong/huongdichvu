			<div class="col-lg-4 sidebar">
				<div class="single-widget search-widget">
					<form class="example" style="margin:auto;max-width:300px">
						<input v-model="keyword" type="text" placeholder="Tìm kiếm" name="search2">
						<button @click="search" type="button"><i class="fa fa-search"></i></button>
					</form>								
				</div>
				<div class="single-slidebar">
					<h4 class="title">Tin mới</h4>
					<?php foreach ($this->newsTop5 as $new) { ?>
					<div class="blog-listt mb-30">
						<div class="img">
							<img src="<?php echo $new['image'] ?>" alt="">
						</div>
						<div class="title">
							<a href="tin-tuc/<?php echo $new['slug'] ?>">
								<h5><?php echo $new['title'] ?></h5>
							</a>
							<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
							<span class="text-dark"><?php echo $new['time'] ?></span>
						</div>
					</div>
					<?php } ?>
				</div>
				<div class="single-slidebar">
					<h4 class="title">Tin liên quan</h4>
					<?php foreach ($this->news as $new) { ?>
					<div class="blog-listt mb-30">
						<div class="img">
							<img src="<?php echo $new['image'] ?>" alt="">
						</div>
						<div class="title">
							<a href="tin-tuc/<?php echo $new['slug'] ?>">
								<h5><?php echo $new['title'] ?></h5>
							</a>
							<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
							<span class="text-dark"><?php echo $new['time'] ?></span>
						</div>
					</div>
					<?php } ?>
				</div>

				
			</div>
		</div>
	</div>	
</section>
			<!-- End blog-posts Area -->