<div id="listSlogan">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Quản lý danh mục</h4>
					<div class="add-slogan">
						<a href="/admin/catagory/add">

							<button type="button" id="tesst" class="btn btn-round btn-success">Thêm</button>
						</a>
					</div>
					<section id="unseen">
						<table class="table table-bordered table-striped table-condensed">
							<thead>
								<tr>
									<th class="numeric">STT</th>
									<th class="numeric">Ảnh</th>
									<th class="numeric">Tên danh mục</th>
									<th class="numeric">rank</th>
									<th class="numeric">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(catagory,index) in catagories">
									<td class="numeric">{{index+1}}</td>
									<td class="numeric">
										<img :src="catagory.image" alt="" style="width: 40px;height: 40px;">
									</td>
									<td class="numeric">{{catagory.name}}</td>
									<td class="numeric">
										<select @change="updateRank(catagory)" v-model="catagory.rank">
											<option value="null">Trống</option>
											<option v-for="rank in catagories.length"  :value="rank"> Top {{rank}}</option>
										</select>
									</td>
									<td class="numeric">

										<a :href="'/admin/catagory/edit/'+catagory.id">
											<button type="button" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i></button>
										</a>
									
										<button 
											@click="removeCatagory(catagory)"
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
