<!-- Start post Area -->
<section class="post-area section-gap">
	<div class="container" id="detail_question">
		<div class="row justify-content-center d-flex">
			<div class="col-lg-8 post-list" >
				
				<div class="single-post job-details">
					<h4 class="single-title">{{detailQuestion.title}}</h4>
					<div class="post-by">
						<span><i class="far fa-user"></i></span>
						Đăng bởi:
						<a href="">{{detailQuestion.full_name}}</a>
					</div>	
					<div class="post-in">
						<span><i class="far fa-clock"></i></span>
						Lĩnh vực: 
						<a href="">{{detailQuestion.catagory}}</a>
					</div>
					<div class="content" v-html="detailQuestion.content">
				
					</div>
					<div class="time-post">
								<span><i class="far fa-calendar-alt"></i></span>
								Ngày đăng: 
								<span class="text-primary">{{detailQuestion.time}}</span>
							</div>
							<div class="view">
								<span><i class="fas fa-eye"></i></span>
								Lượt xem: 
								<span>{{detailQuestion.view}}</span>
							</div>

					<div class="vote">
						<div @click="voteQuestion">
							<span :class="{support_active:detailQuestion.voted}" class="support"><i class="fas fa-check"></i></span>
						</div>
						<div class="text-dark fw400">
							<span class="fz-18">{{detailQuestion.vote}}</span>
						</div>
						
					</div>
				</div>
				<div class="options">
					<div class="answer mt-10">
						<span class="fz-18">{{listAnswer.length}} câu trả lời</span>
					</div>
					<div class="opt">
						<div class="form-select" id="default-select">
							<select>
								<option value="1">Tùy Chọn</option>
								<option value="1">Mới nhât</option>
								<option value="1">Bình chọn nhiều nhất</option>
							</select>
						</div>
					</div>
					<hr>
				</div>
				

				<div v-for="answer in listAnswer" class="single-post job-details answer">
					<div class="post-by">
						<span><i class="far fa-user"></i></span>
						Đăng bởi:
						<a href="">{{answer.full_name}}</a>
					</div>	
					<div class="post-in">
						<span><i class="far fa-calendar-alt"></i></span>
						Thời gian: 
						<span class="text-primary">{{answer.time}}</span>
					</div>
					<div class="content" v-html="answer.content">
						
					</div>
					<div class="vote">
						<div @click="voteAnswer(answer)">
							<span :class="{support_active:answer.voted}" class="support"><i class="fas fa-check"></i></span>
						</div>
						<div class="text-dark fw400">
							<span class="fz-18">{{answer.vote}}</span>
						</div>
					</div>
				</div>
				
				<div class="options" v-if="dexuat.length > 0 && listAnswer.length == 0">
					<div class="answer mt-10">
						<span class="fz-18"> {{dexuat.length}} câu trả lời đề xuất</span>
					</div>
					
					<hr>
				</div>
				<div v-for="answer in dexuat" v-if="answer.sucsong != 0" class="single-post job-details answer">
					<div class="post-by">
						<span><i class="far fa-user"></i></span>
						Đăng bởi:
						<a href="">{{answer.full_name}}</a>
					</div>	
					<div class="post-in">
						<span><i class="far fa-calendar-alt"></i></span>
						Ngày đăng: 
						<span class="text-primary">{{answer.time}}</span>
					</div>
					<div class="content" v-html="answer.content">
						
					</div>
					<div class="vote">
						<div @click="voteAnswer(answer)">
							<span :class="{support_active:answer.voted}" class="support"><i class="fas fa-check"></i></span>
						</div>
						<div class="text-dark fw400">
							<span class="fz-18">{{answer.vote}}</span>
						</div>
					</div>
					
				</div>
				<!-- <hr> -->
				<div class="cmt mt-30">
					<hr>
					<h5 class="mb-2">Câu trả lời của bạn</h5>
					<div class="tl">
						<textarea name="editor1" id="txtFT_Content" name ="txtFT_Content"></textarea>
					</div>
					<div class="error" v-if="error.length > 0">
						<ul>
							<li v-for="err in error" class="text-danger"><p><i class="fa fa-times"></i> {{err}}</p></li>
						</ul>
					</div>
					<div class="mt-30 float-right">
						<button @click="post_answer" class="genric-btn success"> Đăng </button>
					</div>
				</div>
				
				
			</div>
			