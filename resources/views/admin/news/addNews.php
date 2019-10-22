<div id="app">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4>Thêm tin</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
								<div class="cc">
					               	<div class="row">
					               	 	<label class="col-sm-2 col-sm-2 control-label">Nguồn</label>
														<div class="col-sm-10">
																<select class="form-control" data-vv-name="from_site" v-model="from_site">
																	<option v-for="site in sites">{{site}}</option>
																</select>
														</div>
					               </div>
				                </div>

				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Link</label>
														<div class="col-sm-10">
																<input v-validate="'required|max:500'" v-model="link" data-vv-name="link" type="text" class="form-control">
																<div class="text-danger " v-if="errors.has('link')">{{errors.first('link')}}</div>
														</div>
				                	</div>
				                </div>

												<div v-html="message"></div>

				                <div class="act">
				                	<button @click="addNews" type="button" class="btn btn-primary">Thêm</button>
				                	<a href="/admin/news">
				                		<button type="button" class="btn btn-danger">Hủy</button>
				                	</a>
				                </div>
							</div>
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
