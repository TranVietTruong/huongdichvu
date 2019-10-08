<!-- start banner Area -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					<?php echo $this->name_banner ?>				
				</h1>	
				<p class="text-white link-nav"><a href="index.html">Trang Chủ </a>  <span class="lnr lnr-arrow-right"></span>  <a href="category.html"> <?php echo $this->name_banner ?></a></p>


				<form action="/tim-kiem/cau-hoi" method="get" class="serach-form-area" id="form-search">
					<div class="row justify-content-center form-wrap">
						<div class="col-lg-2 form-cols">
							<div class="default-select" id="default-selects">
								<select id="species">
									<option value="NULL">Loại</option>
									<option value="question">Câu hỏi</option>
									<option value="news">Tin tức</option>
								</select>
							</div>
						</div>
						<div class="col-lg-2 form-cols">
							<div class="default-select" id="default-selects2">
								<select id="category" name="cate">
									<option value="NULL">Lĩnh vực</option>
									<?php foreach ($this->catagories as $catagory) { ?>
										<option value="<?php echo $catagory['id'] ?>"><?php echo $catagory['name'] ?></option>
									<?php } ?>
								</select>
							</div>										
						</div>
						<div class="col-lg-6 form-cols" class="keyword">
							<input @keyup="intanceSearch" v-model="keysearch" name="key" type="text" class="form-control" autocomplete="off" placeholder="Tìm kiếm . . .">
					
							<div class="search" v-if="searchs.length > 0 || questions.length > 0 || news.length > 0">
								<div v-if="searchs.length > 0">
									<b class="text-left">Có phải bạn tìm </b>
									<div class="key-search">
										<ul>
											<li @click="keysearch = search.keyword" v-for="search in searchs"><span>{{search.keyword}}</span></li>
										</ul>
									</div>
								</div>
								
								<div v-if="questions.length > 0">
									<hr>
									<b>Câu hỏi đề xuất</b>
									<div class="question">
										<ul>
											<li v-for="question in questions"><a :href="'/cau-hoi/'+question.slug">{{question.title}}</a></li>
										</ul>
									</div>
								</div>
								
								<div v-if="news.length > 0">
									<hr>
									<b>Tin tức đề xuất</b>
									<div class="question">
										<ul>
											<li v-for="tintuc in news"><a :href="'/tin-tuc/'+tintuc.slug">{{tintuc.title}}</a></li>
										</ul>
									</div>
								</div>
								<hr>
							</div>
						</div>
						<div class="col-lg-2 form-cols">
							<button type="submit" class="btn btn-info">
								<span class="lnr lnr-magnifier"></span> Tìm kiếm
							</button>
						</div>								
					</div>
				</form>		

			</div>

		</div>
	</div>
</section>
<!-- End banner Area -->	