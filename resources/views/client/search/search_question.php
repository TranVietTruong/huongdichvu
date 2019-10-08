<!-- Start post Area -->
<section class="post-area section-gap">
	<div class="container">
		<div class="row justify-content-center d-flex">
			<div class="col-lg-8 post-list">
				<?php foreach ($this->search_questions as $question) { ?>
				<div class="single-post d-flex flex-row">
					<div class="thumb">
						<div class="info-review">
							<div class="count-review">
								<span class="vote text-success"><?php echo $question['vote'] ?> </span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="support">
								<span class="vote text-success"><?php echo $question['count_reply'] ?> </span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div
								class="share">
								<span class="vote text-success">
									<i class="fas fa-share-alt"></i>
								</span>
								<span class="fz-13 fw500">chia sẻ</span>
							</div>
						</div>
						<div class="mobile-info-review">
							<div class="mobile-count-review">
								<span class="vote text-success"><?php echo $question['vote'] ?> </span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="mobile-support">
								<span class="vote text-success"><?php echo $question['count_reply'] ?> </span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div 
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
								<a href="<?php echo '/cau-hoi/'.$question['slug'] ?>"><h4><?php echo $question['title'] ?> </h4></a>
								<div class="post-by">
									<span><i class="far fa-user"></i></span>
									Đăng bởi:
									<a href=""><?php echo $question['full_name'] ?> </a>
								</div>	
								<div class="post-in">
									<span><i class="far fa-clock"></i></span>
									Lĩnh vực: 
									<a href=""><?php echo $question['catagory'] ?> </a>
								</div>				
							</div>
						</div>
						<div class="content-question">
							<span class="text-primary">Câu hỏi: </span>
							<div>
								<?php echo $question['content'] ?>
							</div>
						</div>
						<div class="time-post">
							<span><i class="far fa-calendar-alt"></i></span>
							Ngày đăng: 
							<span class="text-primary"><?php echo $question['time'] ?> </span>
						</div>
						<div class="view">
							<span><i class="fas fa-eye"></i></span>
							Lượt xem: 
							<span><?php echo $question['view'] ?> </span>
						</div>
						<div class="read-more">
							<a href="<?php echo '/cau-hoi/'.$question['slug'] ?> " class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
			