<div id="app">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý tài khoản người dùng</h4>

					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th class="numeric">STT</th>
									<th class="numeric">Tên tài khoản</th>
                  <th class="numeric">Email</th>
									<th class="numeric">Fullname</th>
									<th class="numeric">Active</th>
									<th class="numeric">Tag</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(user,index) in listUsers">
									<td class="numeric">{{index+1+(pagination.current_page-1)*10}}</td>
									<td class="numeric">{{user.username}}</td>
                  <td class="numeric">{{user.email}}</td>
									<td class="numeric">{{user.full_name}}</td>
                  <td class="numeric">{{user.active}}</td>
									<td class="numeric">{{user.tag}}</td>
									<td class="numeric">
                    <button
                      @click="updateActive(user)"
                      v-if="user.active"
                      type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>
                    </button>

                    <button
                      @click="updateActive(user)"
                      v-if="!user.active"
                      type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye-slash"></i>
                    </button>

                      <button
  											@click="removeUser(user)"
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
