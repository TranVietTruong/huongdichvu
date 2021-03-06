<section class="contact-page-area section-gap" id="post_question">
	<!-- <div class="container"> -->
		<div class="row">
			<div class="col-lg-12">
				<div class="bg"></div>
				<form class="form-area"  >
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 offset-md-2 form-group">
							<div class="my-post">
								<div class="input-group-icon" style="margin-bottom: 30px;">
									<div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
									<div class="form-select" id="default-select">
										<select id="major">
											<option value="">Lĩnh vực</option>
											<?php foreach ($this->catagories as $catagory) { ?>
												<option value="<?php echo $catagory['id']?>"><?php echo $catagory['name'] ?></option>
											<?php } ?>
										</select>

									</div>
								</div>

								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fas fa-question-circle"></i></div>
									<input v-model="title" type="text" placeholder="Nhập câu hỏi" class="single-input">
								</div>

								<div class="input-group-icon mt-10">
									<div class="icon"><i class="fa fa-tags"></i></div>
									<vue-tags-input
										v-model="tag"
										:tags="tags"
										:autocomplete-items="filteredItems"
										:maxlength="maxLength"
										placeholder="Nhập thẻ tag"
										@tags-changed="newTags => tags = newTags"
									/>
									
								</div>
								<div class="input-group-icon mt-30">
								  	<textarea name="editor1" id="txtFT_Content" name ="txtFT_Content" placeholder="Chi tiết câu hỏi">
								  		
								  	</textarea>
								</div>

								<div class="input-group-icon mt-30">
									<div class="row">
										<div class="col-md-5">
											<img id="captcha" style="height:52px" src="/get_captcha" alt="">
											<button 
												onclick="document.getElementById('captcha').src='/get_captcha'" 
												type="button" 
												class="genric-btn info-border pl-4 pr-4"
												>

												<i class="fas fa-sync-alt"></i>
											</button>
										</div>
										<div class="col-md-7">
											<input v-model="captcha" type="text" placeholder="Nhập captcha" class="single-input form-control">
										</div>
									</div>
								</div>

								<div class="error" v-if="error.length > 0">
									<ul>
										<li v-for="err in error" class="text-danger"><p><i class="fa fa-times"></i> {{err}}</p></li>
									</ul>
								</div>
							</div>
							
							<button @click="register" type="button"  class="primary-btn mt-20 text-white">Hỏi</button>

							<div class="mt-20 alert-msg" style="text-align: left;"></div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="steps" id="steps">
								<h5>Làm thế nào để có một câu hỏi tốt</h5>
								<ul>
									<li>
										<div class="step" id="step">
											<div class="step-left">
												<img src="https://cdn.sstatic.net/Img/list-1.svg?v=e8dd475ba207" alt="">
											</div>
											<span>
												<h6>Chọn lĩnh vực mà bạn quan tâm</h6>
											</span>
											<div class="step-down">
												<i class="fas fa-sort-down"></i>
											</div>
										</div>
										<div class="detail-step">
											Đây sẽ là lĩnh vực mà câu hỏi sẽ hướng tới, nó sẽ giúp câu hỏi của bạn
											tiếp cận đến những người cùng chuyên môn dễ dàng hơn. Nếu những lĩnh vực trên không phải lĩnh vực bạn mong muốn hãy chọn 'lĩnh vực khác'.
											
										</div>
									</li>
									<li>
										<div class="step" id="step">
											<div class="step-left">
												<img src="https://cdn.sstatic.net/Img/list-2.svg?v=e8dd475ba207" alt="">
											</div>
											<span>
												<h6>Nhập câu hỏi muốn hỏi</h6>
											</span>
											<div class="step-down">
												<i class="fas fa-sort-down"></i>
											</div>
										</div>
										<div class="detail-step">
											Hãy cố gắng mô tả ngắn gọn nội dung của câu hỏi,nó sẽ giúp cho người tư vấn dễ dàng nắm bắt được nội dung mà bạn muốn hỏi là gì nếu câu hỏi cần thêm thông tin bạn có thể bổ sung ở bên dưới.
										</div>
									</li>
									<li>
										<div class="step" id="step">
											<div class="step-left">
												<img src="https://cdn.sstatic.net/Img/list-3.svg?v=e8dd475ba207" alt="">
											</div>
											<span>
												<h6>Nhập thẻ tag</h6>
											</span>
											<div class="step-down">
												<i class="fas fa-sort-down"></i>
											</div>

										</div>
										<div class="detail-step">
											Thẻ tag là những từ khóa quan trọng trong câu hỏi của bạn. Nó giúp hệ thống có thể đánh giá và đề xuất câu hỏi của bạn tới những người liên quan nhất.
										</div>
									</li>
									
								</ul>
							</div>
							<div class="rule">
								<p>Cảm ơn bạn đã đặt câu hỏi cho chúng tôi</p>
								<p>Tuy nhiên câu hỏi của bạn sẽ được công bố rộng rãi đến mọi người vì vậy bạn hãy chắc chắn về câu hỏi của mình nên có những điều sau đây</p>
								<ul>
									<li><i class="fa fa-check text-success"></i> Nên có những phép lịch sự tối thiểu</li>
									<li><i class="fa fa-check text-success"></i> Ngôn từ trong sáng dễ hiểu</li>
									<li><i class="fa fa-check text-success"></i> Cung cấp đẩy đủ các thông tin cần thiết</li>
								</ul>
								<p class="mt-2">Và cần tránh tuyệt đối những điều sau đây</p>
								<ul>
									<li><i class="fa fa-times text-danger"></i> Các vấn đề tôn giáo, sắc tộc</li>
									<li><i class="fa fa-times text-danger"></i> Ngôn từ thô tục, đả kích</li>
									<li><i class="fa fa-times text-danger"></i> Nói xấu cá nhân, tổ chức</li>
								</ul>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<!-- </div>	 -->
</section>
