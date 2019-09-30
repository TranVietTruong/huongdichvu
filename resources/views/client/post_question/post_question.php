<section class="contact-page-area section-gap" id="post_question">
	<!-- <div class="container"> -->
		<div class="row">
			<div class="col-lg-12">
				<form class="form-area"  >
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 offset-md-3 form-group">
							
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
								<div class="icon"><i class="fa fa-bookmark"></i></div>
								<input v-model="title" type="text" placeholder="Tiêu đề" class="single-input">
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
							  	<textarea name="editor1" id="txtFT_Content" name ="txtFT_Content"></textarea>
							</div>

							<div class="error" v-if="error.length > 0">
								<ul>
									<li v-for="err in error" class="text-danger"><p><i class="fa fa-times"></i> {{err}}</p></li>
								</ul>
							</div>

							
							<button @click="register" type="button"  class="primary-btn mt-20 text-white">Hỏi</button>
							<div class="mt-20 alert-msg" style="text-align: left;"></div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="dexuat">
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<!-- </div>	 -->
</section>
