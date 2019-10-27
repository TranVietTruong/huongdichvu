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
                  <th class="numeric">Active</th>
									<th class="numeric">Người hỏi</th>
									<th class="numeric">View</th>
                  <th class="numeric">Vote</th>
                  <th class="numeric">Trả lời</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody v-for="(question,index) in listQuestion">
								<tr>
									<td class="numeric">{{index+1+(pagination.current_page-1)*pagination.per_page}}</td>
									<td class="numeric" v-on:click="show(question)">{{question.title}}</td>
									<td class="numeric" v-on:click="show(question)" v-html='question.content'></td>
                  <td class="numeric">{{question.active}}</td>
                  <td class="numeric">{{question.full_name}}</td>
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
											type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i>
										</button>
									</td>
								</tr>
								<tr v-for="(answer,index) in question.answers" v-show="question.show">
									<td class="bg-success">Answer {{index+1}}</td>
									<td class="bg-success">Câu trả lời</td>
									<td class="bg-success">{{answer.content_text}}</td>
									<td class="bg-success">{{answer.active}}</td>
									<td class="bg-success">{{answer.full_name}}</td>
									<td class="bg-success">{{answer.view}}</td>
									<td class="bg-success">{{answer.vote}}</td>
									<td class="bg-success">0</td>
									<td class="bg-success">

										<button
											@click="updateActive_ans(answer)"
											v-if="answer.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>
										</button>

										<button
											@click="updateActive_ans(answer)"
											v-if="!answer.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye-slash"></i>
										</button>

										<button
											@click="removeAnswer(question,answer)"
											type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i>
										</button>
									</td>
								</tr>
                <!-- <tr v-for="(answer,index) in question.answers" >
                  <td class="numeric">{{index+1}}</td>
                  <td class="numeric">{{question.title}}</td>
                  <td class="numeric">{{answer.content_text}}</td>
                  <td class="numeric">{{answer.active}}</td>
                  <td class="numeric">{{answer.full_name}}</td>
                  <td class="numeric">{{answer.view}}</td>
                  <td class="numeric">{{answer.vote}}</td>
                  <td class="numeric">none</td>
                  <td class="numeric">{{answer.vote}}</td>
                </tr> -->
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
