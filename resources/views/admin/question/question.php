<div id="app">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý câu hỏi</h4>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th class="numeric">STT</th>
									<th class="numeric">Tiêu đề</th>
									<th class="numeric">Nội dung</th>
									<th class="numeric">Người hỏi</th>
									<th class="numeric">View</th>
                  <th class="numeric">Vote</th>
                  <th class="numeric">Trả lời</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(question,index) in listQuestion">
									<td class="numeric">{{index+1}}</td>
									<td class="numeric">{{question.title}}</td>
									<td class="numeric" v-html='question.content'></td>
                  <td class="numeric">{{question.fullname}}</td>
									<td class="numeric">{{question.view}}</td>
									<td class="numeric">{{question.vote}}</td>
                  <td class="numeric">{{question.count_reply}}</td>
									<td class="numeric">
										<button
											@click="updateActive(question)"
											v-if="question.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>
										</button>

										<button
											@click="updateActive(question)"
											v-if="!question.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye-slash"></i>
										</button>

										<button
											@click="removeQuestion(question)"
											type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
									</td>
								</tr>
							</tbody>
						</table>
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
					</section>

				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
	</section>
	<!-- /wrapper -->
</section>
</div>
