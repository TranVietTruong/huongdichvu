<!-- Start post Area -->
<section class="post-area section-gap">
	<div class="container">
		<div class="row justify-content-center d-flex">
			<div class="col-lg-12 post-list">
				<div class="row d-flex justify-content-center">
					<div class="menu-content pb-60 col-lg-10">
						<div class="title text-center">
							<h1 class="mb-10">Câu Hỏi</h1>
							
						</div>
					</div>
				</div>	
				<?php  foreach ($this->questions as $question) { ?>
				<div class="single-post d-flex flex-row">
					<div class="thumb">
						<div class="info-review">
							<div class="count-review">
								<span class="vote text-success"><?php echo $question['vote'] ?></span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="support">
								<span class="vote text-success"><?php echo $question['count_reply'] ?></span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div 
								onclick="share('https://tuvankhoinghiep.me/cau-hoi/<?php echo $question['slug'] ?>')" class="share">
								<span class="vote text-success">
									<i class="fas fa-share-alt"></i>
								</span>
								<span class="fz-13 fw500">chia sẻ</span>
							</div>
						</div>
						<div class="mobile-info-review">
							<div class="mobile-count-review">
								<span class="vote text-success"><?php echo $question['vote'] ?></span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="mobile-support">
								<span class="vote text-success"><?php echo $question['count_reply'] ?></span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div 
								onclick="share('https://tuvankhoinghiep.me/cau-hoi/<?php echo $question['slug'] ?>')"
								class="mobile-share">
								<span class="vote text-success">
									<i class="fas fa-share-alt"></i>
								</span>
								<span class="fz-13 fw500">chia sẻ</span>
							</div>
						</div>
					</div>
					<div class="details">
						<div class="title d-flex flex-row justify-content-between">
							<div class="titles">
								<a href="/cau-hoi/<?php echo $question['slug']?>"><h4><?php echo $question['title'] ?></h4></a>
								<div class="post-by">
									<span><i class="far fa-user"></i></span>
									Đăng bởi:
									<a href=""><?php echo $question['full_name'] ?></a>
								</div>	
								<div class="post-in">
									<span><i class="far fa-clock"></i></span>
									Lĩnh vực: 
									<a href=""><?php echo $question['catagory'] ?></a>
								</div>				
							</div>
						</div>
						<div class="content-question">
							<span class="text-primary">Chi tiết: </span>
							<?php echo $question['content'] ?>
						</div>
						<div class="time-post">
							<span><i class="far fa-calendar-alt"></i></span>
							Thời gian: 
							<span class="text-primary"><?php echo $question['time'] ?></span>
						</div>
						<div class="view">
							<span><i class="fas fa-eye"></i></span>
							Lượt xem: 
							<span><?php echo $question['view'] ?></span>
						</div>
						<div class="read-more">
							<a href="/cau-hoi/<?php echo $question['slug']?>" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
				<?php }?>
				
				
				<a  style="background: #38a4ff" class="text-uppercase loadmore-btn mx-auto d-block" href="/cau-hoi">Xem Thêm</a>

			</div>
			
		</div>
	</div>	
</section>
			<!-- End post Area -->