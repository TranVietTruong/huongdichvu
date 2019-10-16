<section class="blog-posts-area section-gap" id="news">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 post-list blog-post-list">
				<div v-for="tintuc in listNews" class="single-post d-flex">
					<div class="img">
						<img :src="tintuc.image" alt="">
					</div>
					<div class="title-news">
						<a :href="'tin-tuc/'+tintuc.slug">
							<h4 v-html="tintuc.title"></h4>
						</a>
						<div class="time">
							<span><i class="far fa-calendar-alt"></i></span>
							Ngày đăng: 
							<span class="text-primary">{{tintuc.time}}</span>
						</div>
						<div class="read-more mt-3">
							<a :href="'tin-tuc/'+tintuc.slug" class="genric-btn info circle arrow small">Xem thêm<span class="lnr lnr-arrow-right"></span></a>
						</div>
					</div>
				</div>
				<div class="ml-4 mt-5">
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
			</div>
			