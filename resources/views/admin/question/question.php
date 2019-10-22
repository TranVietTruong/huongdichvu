<div id="app">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý Câu hỏi</h4>
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
								<tr v-for="(admin,index) in listAdmin">
									<td class="numeric">{{index+1}}</td>
									<td class="numeric">{{admin.full_name}}</td>
									<td class="numeric">{{admin.email}}</td>
									<td class="numeric">{{admin.username}}</td>
									<td class="numeric">{{admin.active}}</td>
									<td class="numeric">
										<button
											@click="updateActive(admin)"
											v-if="admin.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>
										</button>

										<button
											@click="updateActive(admin)"
											v-if="!admin.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye-slash"></i>
										</button>

										<button
											@click="removeAdmin(admin)"
											type="button" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
									</td>
								</tr>
							</tbody>
						</table>
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
