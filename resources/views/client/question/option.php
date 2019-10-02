<div class="col-lg-4 sidebar">
				<div class="single-slidebar">
					<h4>Lĩnh vực</h4>
					<div class="catagory-carusel">
						<?php for($i=0;$i<ceil(count($this->catagories))/6;$i++) { ?>
						<div class="single-catagory">
							<ul class="cat-list">
								<?php for($j=6*$i;$j<6*($i+1);$j++){ if(isset($this->catagories[$j])){ ?>
								<li>
									<a class="justify-content-between d-flex" href="category.html">
										<p>
											<?php 
												echo $this->catagories[$j]['name'] 
											?>
											
										</p>
									</a>
								</li>
								<?php }}?>
							</ul>
						</div>
						<?php } ?>
					</div>
				</div>

				<div class="single-slidebar">
					<h4>Có thể bạn biết</h4>
					<div class="active-relatedjob-carusel">
						<?php foreach ($this->questions as $question) { ?>
						<div class="single-rated">
							<div class="ask-for">
								<div class="ask-count-review">
									<span class="vote text-success"><?php echo $question['vote'] ?></span>
									<span class="fz-13 fw500">đánh giá</span>
								</div>
								<div class="ask-support">
									<span class="vote text-success"><?php echo $question['count_reply'] ?></span>
									<span class="fz-13 fw500">câu trả lời</span>
								</div>
								<div class="ask-share">
									<span class="vote text-success">
										<i class="fas fa-share-alt"></i>
									</span>
									<span class="fz-13 fw500">chia sẻ</span>
								</div>
							</div>
							<a href="/cau-hoi/<?php echo $question['slug'] ?>"><h4><?php echo $question['title'] ?></h4></a>
							<div class="ask-post-by">
								<span><i class="far fa-user"></i></span>
								Đăng bởi:
								<a href=""><?php echo $question['full_name'] ?></a>
							</div>	
							<div class="ask-post-in">
								<span><i class="far fa-clock"></i></span>
								Lĩnh vực: 
								<a href=""><?php echo $question['catagory'] ?></a>
							</div>
							<div class="content-question">
								<span class="text-primary">Câu hỏi: </span>
								<?php echo $question['content'] ?>
							</div>
							<div class="time-post">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-primary"><?php echo $question['time'] ?></span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i></span>
								Lượt xem: 
								<span><?php echo $question['view'] ?></span>
							</div>
							<div class="read-more">
								<a href="/cau-hoi/<?php echo $question['slug'] ?>" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>
						<?php } ?>														
					</div>
				</div>							
				<div class="single-slidebar">
					<h4>Thẻ tags</h4>
					<div class="tags">
						<ul class="list-tag">
							<li v-for="tag in tags"><a href="">{{tag.name}} ( {{tag.total}} )</a></li>
						</ul>
					</div>
				</div>

				<div class="single-slidebar">
					<h4>Tin tức</h4>
					<?php foreach ($this->news as $new) { ?>
					<div class="blog-listt mb-30">
						<div class="img">
							<img src="<?php echo $new['image'] ?>" alt="">
						</div>
						<div class="title">
							<a href="">
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
			<!-- End post Area -->