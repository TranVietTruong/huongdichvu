<!-- Start post Area -->
<section class="post-area section-gap" id="user" style="position: relative;">
	<div class="container">
		<div class="row justify-content-center d-flex">
			<div class="col-lg-2 sidebar">
				<div class="left">
					<div class="user">
						<h4><?php echo $_SESSION['user']['full_name'] ?></h4>
						<ul class="manager">
							<li @click="question" :class="{active: current == 'question'}">Câu hỏi</li>
							<li @click="answer" :class="{active: current == 'answer'}">Câu trả lời</li>
							<li @click="user" :class="{active: current == 'user'}">Thông tin cá nhân</li>
							<li><a href="/dang-xuat" style="display: block;width: 100%;height: 100%">Đăng Xuất </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-10 post-list">
				<div class="tab-question" :class="{notActive: current != 'question'}">
					<div v-for="question in questions">
						<div class="single-question">
							<div class="title">
								<a :href="'/cau-hoi/'+question.slug"><h4>{{question.title}}</h4></a>
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
									<span>{{question.view}}</span>
								</div>
								<div class="tags">
									<span><i class="fas fa-tags"></i></span>
									<ul>
										<li v-for="tag in question.tags">{{tag.name}}</li>
									</ul>
								</div>
							</div>
							<div class="action">
								<div @click="remove_question(question)" class="remove">
									<i class="fa fa-times"></i>
								</div>
							</div>
						</div>
					</div>

					
				</div>	
				<div class="tab-answer" :class="{notActive: current != 'answer'}">
					<div v-for="answer in answers" class="single-answer">
						<div class="answer"  >
							<a :href="'/cau-hoi/'+answer.slug"><h5>Trong câu hỏi: {{answer.title}}</h5></a>
							Trả lời:
							<div v-html="answer.content" class="content-answer"> 
								
							</div>
						</div>
						<div class="info">
							<div class="time">
								<span><i class="far fa-calendar-alt"></i> Ngày đăng: </span>
								<span class="text-primary">{{answer.time}}</span>
							</div>
							<div class="view">
								<span><i class="fas fa-check"></i> Lượt vote:</span>
								<span>{{answer.vote}}</span>
							</div>
						</div>	
						<div class="action">
							<!-- <div class="edit">
								<i class="fa fa-pencil"></i>
							</div> -->
							<div @click="remove_answer(answer)" class="remove">
								<i class="fa fa-times"></i>
							</div>
						</div>	

					</div>
				</div>	

				<div class="tab-info" :class="{notActive: current != 'user'}">
					<div class="info">
						<input id="name_user" type="hidden" value="<?php echo $_SESSION['user']['full_name']?>">
						<ul class="detail">
							<li>
								<span class="head"><strong>Tên</strong></span>
								<span v-show="!showEditName" class="name">
									{{name_user}} 
									<i @click="showEditName = !showEditName" class="fa fa-pencil"></i>
								</span>
								<span v-show="showEditName" class="edit-name">
									<input v-validate="'required|max:30|min:3'" data-vv-name="name" type="text" v-model="name_user">
									<span class="text-danger " v-if="errors.has('name')">{{errors.first('name')}}</span>
									<i @click="update_name" class="fa fa-check fa-2x"></i>
									<i @click="showEditName = !showEditName" class="fa fa-times fa-2x"></i>
								</span>
							</li>
							<li>
								<span class="head"><strong>Email</strong></span>
								<span class="name"><?php echo $_SESSION['user']['email'] ?></span>
							</li>
							<li>
								<span class="head"><strong>Tên tài khoản</strong></span>
								<span class="name"><?php echo $_SESSION['user']['username'] ?></span>
							</li>
							<li>
								<span @click="showEditPass = !showEditPass" class="head" style="cursor: pointer;"><strong>Đổi mật khẩu</strong></span>

								<div v-if="showEditPass" class="edit-pass">
									<form data-vv-scope="password">
										<div class="input-group-icon mt-10">
											<input data-vv-name="pass" v-validate="'required'" v-model="pass" type="password" placeholder="Nhập mật khẩu">
											<span class="text-danger " v-if="errors.has('password.pass')">{{errors.first('password.pass')}}</span>
										</div>
										<div class="input-group-icon mt-10">
											<input data-vv-name="newpass" v-validate="'required|min:3'" v-model="newpass" type="password" placeholder="Nhập mật mới">
											<span class="text-danger " v-if="errors.has('password.newpass')">{{errors.first('password.newpass')}}</span>
										</div>
										<div class="input-group-icon mt-10">
											<input data-vv-name="renewpass" v-validate="{required:true,is:newpass}" type="password" v-model="renewpass" placeholder="Nhập lại mật khẩu mới">
											<span class="text-danger " v-if="errors.has('password.renewpass')">{{errors.first('password.renewpass')}}</span>
										</div>
										<div class="input-group-icon mt-10 aa">
											<button @click="update_pass" type="button" class="genric-btn small">Đổi</button>
										</div>
									</form>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>	
</section>