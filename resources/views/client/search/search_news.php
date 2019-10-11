<section class="blog-posts-area section-gap" id="news">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 post-list blog-post-list">
				<?php foreach ($this->search_news as $news) { ?>
				<div class="single-post d-flex">
					<div class="img">
						<img src="<?php echo $news['image'] ?>" alt="">
					</div>
					<div class="title-news">
						<a href="<?php echo '/tin-tuc/'.$news['slug'] ?>">
							<h4><?php echo $news['title'] ?></h4>
						</a>
						<div class="time">
							<span><i class="far fa-calendar-alt"></i></span>
							Ngày đăng: 
							<span class="text-primary"><?php echo $news['time'] ?></span>
						</div>
						<div class="read-more mt-3">
							<a href="<?php echo '/tin-tuc/'.$news['slug'] ?>" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>	
				<?php } ?>																
			</div>