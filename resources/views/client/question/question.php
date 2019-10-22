<!-- Start post Area -->
<section class="post-area section-gap">
	<div class="container">
		
		<div class="row justify-content-center d-flex">
			<div class="col-lg-8 post-list">
				<ul class="cat-list">
					<li :class="object" @click="getQuestion"><a>Mới nhất</a></li>
					<li :class="object1" @click="getQuestionOrderByView"><a>Xem nhiều</a></li>
					<li :class="object2" @click="getQuestionOrderByVote"><a>Vote nhiều</a></li>
					<li :class="object3" @click="getQuestionInDay"><a>Trong ngày</a></li>
					<li :class="object4" @click="getQuestionInWeek"><a>Trong tuần</a></li>
					<li :class="object5" @click="getQuestionInMonth"><a>Trong tháng</a></li>
				</ul>

				<div v-for="question in listQuestion" class="single-post d-flex flex-row">
					<div class="thumb">
						<div class="info-review">
							<div class="count-review">
								<span class="vote text-success">{{question.vote}}</span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="support">
								<span class="vote text-success">{{question.count_reply}}</span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div
								@click="share('http://huongdichvu.com:8888/cau-hoi/'+question.slug)" 
								class="share">
								<span class="vote text-success">
									<i class="fas fa-share-alt"></i>
								</span>
								<span class="fz-13 fw500">chia sẻ</span>
							</div>
						</div>
						<div class="mobile-info-review">
							<div class="mobile-count-review">
								<span class="vote text-success">{{question.vote}}</span>
								<span class="fz-13 fw500">đánh giá</span>
							</div>
							<div class="mobile-support">
								<span class="vote text-success">{{question.count_reply}}</span>
								<span class="fz-13 fw500">câu trả lời</span>
							</div>
							<div 
								@click="share('http://huongdichvu.com:8888/cau-hoi/'+question.slug)" 
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
								<a :href="'/cau-hoi/'+question.slug"><h4>{{question.title}}</h4></a>
								<div class="post-by">
									<span><i class="far fa-user"></i></span>
									Đăng bởi:
									<a href="">{{question.full_name}}</a>
								</div>	
								<div class="post-in">
									<span><i class="far fa-clock"></i></span>
									Lĩnh vực: 
									<a href="">{{question.catagory}}</a>
								</div>				
							</div>
						</div>
						<div class="content-question">
							<span class="text-primary">Câu hỏi: </span>
							<div v-html="question.content">
								
							</div>
						</div>
						<div class="time-post">
							<span><i class="far fa-calendar-alt"></i></span>
							Thời gian: 
							<span class="text-primary">{{question.time}}</span>
						</div>
						<div class="view">
							<span><i class="fas fa-eye"></i></span>
							Lượt xem: 
							<span>{{question.view}}</span>
						</div>
						<div class="read-more">
							<a :href="'/cau-hoi/'+question.slug" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
				<paginate
					v-if="pagination.last_page > 1"
					:page-count="pagination.last_page"
					:click-handler="FetchPagination"
					:prev-text="'&lt;'"
					:next-text="'&gt;'"
					:container-class="'paginate'"
					:first-button-text="'&laquo;'"
					:last-button-text="'&raquo;'"
					:first-last-button="true">
				</paginate>
			</div>
			