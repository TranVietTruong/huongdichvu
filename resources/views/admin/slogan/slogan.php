<div id="listSlogan">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý slogan</h4>
					<div class="add-slogan">
						<a href="/admin/slogan/add">

							<button type="button" id="tesst" class="btn btn-round btn-success">Thêm</button>
						</a>
					</div>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th class="numeric">STT</th>
									<th class="numeric">Tên tác giả</th>
									<th class="numeric">avatar</th>
									<th class="numeric">Mô tả</th>
									<th class="numeric">Nội dung</th>
									<th class="numeric">Đăng bởi</th>
									<th class="numeric">rank</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(slogan,index) in listSlogan">
									<td class="numeric">{{index+1}}</td>
									<td class="numeric">{{slogan.author}}</td>
									<td class="numeric">
										<img :src="slogan.image" alt="" style="width: 40px;height: 40px;">
									</td>
									<td class="numeric">{{slogan.description}}</td>
									<td class="numeric" style="width: 30%">{{slogan.content}}</td>
									<td class="numeric">{{slogan.post_by}}</td>
									<td class="numeric">
										<select @change="updateRank(slogan)" v-model="slogan.rank">
											<option value="null">Trống</option>
											<option v-for="rank in listSlogan.length" :value="rank"> Top {{rank}}</option>
										</select>
									</td>
									<td class="numeric">
										
										<button 
											@click="updateActive(slogan)" 
											v-if="slogan.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye"></i>
										</button>

										<button
											@click="updateActive(slogan)" 
											v-if="!slogan.active"
											type="button" class="btn btn-primary btn-xs"><i class="fa fa-eye-slash"></i>
										</button>


										<a :href="'/admin/slogan/edit/'+slogan.id">
											<button type="button" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></button>
										</a>
									
										<button 
											@click="removeSlogan(slogan)"
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
