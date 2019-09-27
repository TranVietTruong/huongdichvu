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
					<h4>Câu hỏi đề xuất</h4>
					<div class="active-relatedjob-carusel">
						<div class="single-rated">
							<div class="ask-for">
								<div class="ask-count-review">
									<span class="vote text-success">3000</span>
									<span class="fz-13 fw500">đánh giá</span>
								</div>
								<div class="ask-support">
									<span class="vote text-success">31</span>
									<span class="fz-13 fw500">câu trả lời</span>
								</div>
								<div class="ask-share">
									<span class="vote text-success">
										<i class="fas fa-share-alt"></i>
									</span>
									<span class="fz-13 fw500">chia sẻ</span>
								</div>
							</div>
							<a href="single.html"><h4>Xin sát nhập doanh nghiệp ở đâu?</h4></a>
							<div class="ask-post-by">
								<span><i class="far fa-user"></i></span>
								Đăng bởi:
								<a href=""> Trần Viết Trưởng</a>
							</div>	
							<div class="ask-post-in">
								<span><i class="far fa-clock"></i></span>
								Lĩnh vực: 
								<a href=""> Công nghệ thông tin</a>
							</div>
							<p>
								<span class="text-primary">Câu hỏi: </span>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque facere soluta dicta delectus
							</p>
							<div class="time-post">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-primary">12/09/2019</span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i></span>
								Lượt xem: 
								<span>129</span>
							</div>
							<div class="read-more">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>
						<div class="single-rated">
							<div class="ask-for">
								<div class="ask-count-review">
									<span class="vote text-success">3000</span>
									<span class="fz-13 fw500">đánh giá</span>
								</div>
								<div class="ask-support">
									<span class="vote text-success">31</span>
									<span class="fz-13 fw500">câu trả lời</span>
								</div>
								<div class="ask-share">
									<span class="vote text-success">
										<i class="fas fa-share-alt"></i>
									</span>
									<span class="fz-13 fw500">chia sẻ</span>
								</div>
							</div>
							<a href="single.html"><h4>Xin sát nhập doanh nghiệp ở đâu?</h4></a>
							<div class="ask-post-by">
								<span><i class="far fa-user"></i></span>
								Đăng bởi:
								<a href=""> Trần Viết Trưởng</a>
							</div>	
							<div class="ask-post-in">
								<span><i class="far fa-clock"></i></span>
								Lĩnh vực: 
								<a href=""> Công nghệ thông tin</a>
							</div>
							<p>
								<span class="text-primary">Câu hỏi: </span>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque facere soluta dicta delectus
							</p>
							<div class="time-post">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-primary">12/09/2019</span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i></span>
								Lượt xem: 
								<span>129</span>
							</div>
							<div class="read-more">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>
						<div class="single-rated">
							<div class="ask-for">
								<div class="ask-count-review">
									<span class="vote text-success">3000</span>
									<span class="fz-13 fw500">đánh giá</span>
								</div>
								<div class="ask-support">
									<span class="vote text-success">31</span>
									<span class="fz-13 fw500">câu trả lời</span>
								</div>
								<div class="ask-share">
									<span class="vote text-success">
										<i class="fas fa-share-alt"></i>
									</span>
									<span class="fz-13 fw500">chia sẻ</span>
								</div>
							</div>
							<a href="single.html"><h4>Xin sát nhập doanh nghiệp ở đâu?</h4></a>
							<div class="ask-post-by">
								<span><i class="far fa-user"></i></span>
								Đăng bởi:
								<a href=""> Trần Viết Trưởng</a>
							</div>	
							<div class="ask-post-in">
								<span><i class="far fa-clock"></i></span>
								Lĩnh vực: 
								<a href=""> Công nghệ thông tin</a>
							</div>
							<p>
								<span class="text-primary">Câu hỏi: </span>
								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque facere soluta dicta delectus
							</p>
							<div class="time-post">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-primary">12/09/2019</span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i></span>
								Lượt xem: 
								<span>129</span>
							</div>
							<div class="read-more">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>																	
					</div>
				</div>							


				<div class="single-slidebar">
					<h4>Tin tức</h4>
					<div class="blog-list mb-30">
						<div class="single-blog " style="background:#000 url(img/blog1.jpg);">
							<a href="single.html"><h4 class="text-dark">Home Audio Recording <br>
							For Everyone</h4></a>
							<div class="time text-dark">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-dark">12/09/2019</span>
							</div>
							<div class="read-more text-center">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>																
					</div>
					<div class="blog-list mb-30">
						<div class="single-blog " style="background:#000 url(img/blog1.jpg);">
							<a href="single.html"><h4 class="text-dark">Home Audio Recording <br>
							For Everyone</h4></a>
							<div class="time text-dark">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-dark">12/09/2019</span>
							</div>
							<div class="read-more text-center">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>																
					</div>
					<div class="blog-list">
						<div class="single-blog " style="background:#000 url(img/blog1.jpg);">
							<a href="single.html"><h4 class="text-dark">Home Audio Recording <br>
							For Everyone</h4></a>
							<div class="time text-dark">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-dark">12/09/2019</span>
							</div>
							<div class="read-more text-center">
								<a href="#" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
							</div>
						</div>																
					</div>
				</div>							

			</div>
		</div>
	</div>	
</section>
			<!-- End post Area -->