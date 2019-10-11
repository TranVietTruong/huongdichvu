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
																<select class="form-control">
																	<option>brandsvietnam.com</option>
																	<option>khoinghiepvietnam.org</option>
																	<option>khoi.nghiep.vn</option>
																</select>
														</div>
					               </div>
				                </div>
				                <div class="cc">
				                	<div class="row">
				                		<label class="col-sm-2 col-sm-2 control-label">Link</label>
														<div class="col-sm-10">
																<input v-validate="'required|max:500'" v-model="link" data-vv-name="link" @change="changeLink($event)" type="text" class="form-control">
																<div class="text-danger " v-if="errors.has('link')">{{errors.first('link')}}</div>
														</div>
				                	</div>
				                </div>

												<div class="cc">
													<div class="row">
														<label class="col-sm-2 col-sm-2 control-label">Preview</label>
														<div class="col-sm-10" v-if="hasPreview">
																<div style="width: 450px; height: 720px">
																	{{preview}}
																</div>
														</div>
													</div>
												</div>
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
