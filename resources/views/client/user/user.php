<!-- Start post Area -->
<section class="post-area section-gap" id="user">
	<div class="container">
		<div class="row justify-content-center d-flex">
			<div class="col-lg-2 sidebar">
				<div class="left">
					<div class="user">
						<h4>Trần Viết Trưởng</h4>
						<ul class="manager">
							<li @click="question" :class="{active: current == 'question'}">Câu hỏi</li>
							<li @click="answer" :class="{active: current == 'answer'}">Câu trả lời</li>
							<li>Thông tin cá nhân</li>
							<li>Đăng Xuất</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-10 post-list">
				<div class="tab-question" :class="{notActive: current != 'question'}">
					<div v-for="question in questions" class="single-question">
						<div class="title">
							<a href=""><h4>{{question.title}}</h4></a>
						</div>
						<div class="info">
							<div class="cate">
								<span><i class="far fa-clock"></i> Lĩnh vực: </span>
								<a href="">{{question.catagory}}</a>
							</div>	
							<div class="time">
								<span><i class="far fa-calendar-alt"></i> Ngày đăng: </span>
								<span class="text-primary">{{question.time}}</span>
							</div>
							<div class="view">
								<span><i class="fas fa-check"></i> Lượt vote:</span>
								<span>{{question.vote}}</span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i> Lượt xem: </span>
								<span>{{question.vote}}</span>
							</div>
							<div class="tags">
								<span><i class="fas fa-tags"></i></span>
								<ul>
									<li v-for="tag in question.tags">{{tag.name}}</li>
								</ul>
							</div>
						</div>
						<div class="action">
							<div class="edit">
								<i class="fa fa-pencil"></i>
							</div>
							<div class="remove">
								<i class="fa fa-times"></i>
							</div>
						</div>
					</div>
					
				</div>	
				<div class="tab-answer" :class="{notActive: current != 'answer'}">
					<div class="single-answer">
						<div class="answer">
							<a href=""><h5>Câu hỏi: Dữ liệu về sản xuất chè theo tiêu chuẩn GAP của các tỉnh thành ở VN hiện nay</h5></a>
							<p>Lorem </p>
						</div>
						<div class="info">
							<div class="time">
								<span><i class="far fa-calendar-alt"></i> Ngày đăng: </span>
								<span class="text-primary">12/12/2012</span>
							</div>
							<div class="view">
								<span><i class="fas fa-check"></i> Lượt vote:</span>
								<span>123</span>
							</div>
						</div>	
						<div class="action">
							<div class="edit">
								<i class="fa fa-pencil"></i>
							</div>
							<div class="remove">
								<i class="fa fa-times"></i>
							</div>
						</div>	

					</div>

					<div class="single-answer">
						<div class="answer">
							<a href=""><h5>Câu hỏi: Dữ liệu về sản xuất chè theo tiêu chuẩn GAP của các tỉnh thành ở VN hiện nay</h5></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam deserunt odio, fugit id, maxime molestiae provident fugiat aliquid voluptatibus sunt, labore est dolore ullam explicabo inventore. Sed nobis ex maiores.</p>
						</div>
						<div class="info">
							<div class="time">
								<span><i class="far fa-calendar-alt"></i> Ngày đăng: </span>
								<span class="text-primary">12/12/2012</span>
							</div>
							<div class="view">
								<span><i class="fas fa-check"></i> Lượt vote:</span>
								<span>123</span>
							</div>
						</div>	
						<div class="action">
							<div class="edit">
								<i class="fa fa-pencil"></i>
							</div>
							<div class="remove">
								<i class="fa fa-times"></i>
							</div>
						</div>	

					</div>
					<div class="single-answer">
						<div class="answer">
							<a href=""><h5>Câu hỏi: Dữ liệu về sản xuất chè theo tiêu chuẩn GAP của các tỉnh thành ở VN hiện nay</h5></a>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam deserunt odio, fugit id, maxime molestiae provident fugiat aliquid voluptatibus sunt, labore est dolore ullam explicabo inventore. Sed nobis ex maiores.</p>
						</div>
						<div class="info">
							<div class="time">
								<span><i class="far fa-calendar-alt"></i> Ngày đăng: </span>
								<span class="text-primary">12/12/2012</span>
							</div>
							<div class="view">
								<span><i class="fas fa-check"></i> Lượt vote:</span>
								<span>123</span>
							</div>
						</div>	
						<div class="action">
							<div class="edit">
								<i class="fa fa-pencil"></i>
							</div>
							<div class="remove">
								<i class="fa fa-times"></i>
							</div>
						</div>	

					</div>
				</div>

				
			</div>
			
		</div>
	</div>	
</section>
			<!-- End post Area -->