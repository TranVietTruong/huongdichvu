<div id="app">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý tin tức</h4>
					<div class="add-slogan">
						<a href="/admin/news/add">
							<button type="button"  class="btn btn-round btn-success">Thêm tin từ nguồn khác</button>
						</a>
					</div>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th class="numeric">STT</th>
									<th class="numeric">Tiêu đề</th>
									<th class="numeric">Thumbnail</th>
									<th class="numeric">Danh mục</th>
									<th class="numeric">Slug</th>
									<th class="numeric">Đăng bởi</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(news,index) in listNews">
									<td class="numeric">{{index+1+(pagination.current_page-1)*pagination.per_page}}</td>
									<td class="numeric">{{news.title}}</td>
									<td class="numeric">
										<img :src="news.image" alt="" style="width: 40px;height: 40px;">
									</td>
									<td class="numeric">{{news.id_category}}</td>
                  <td class="numeric">{{news.slug}}</td>
									<td class="numeric">{{news.post_by}}</td>
									<td class="numeric">
										<button
											@click="removeNews(news)"
											type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
									</td>
								</tr>
							</tbody>
						</table>
					</section>
					<div class="col-lg-12">
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
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>
</div>
