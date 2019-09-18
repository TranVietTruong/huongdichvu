<div id="addSlogan">
<section id="main-content">
	<section class="wrapper">
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4> Thêm slogan</h4>
					<section id="unseen">
						<div class="row">
							<div class="col-md-6 col-md-push-3">
								<div class="cc">
					                <label class="col-sm-2 col-sm-2 control-label">Tác giả</label>
					                <div class="col-sm-10">
					                    <input v-model="author" type="text" class="form-control">
					                </div>
				                </div>
				                <div class="cc">
				                	<label class="col-sm-2 col-sm-2 control-label">Avatar</label>
				                	<div class="col-sm-10">
				                		<input type="file" class="form-control">
				                	</div>
				                </div>

				                <div class="cc">
				                	<label class="col-sm-2 col-sm-2 control-label">Mô tả</label>
				                	<div class="col-sm-10">
				                		<input v-model="description" type="text" class="form-control">
				                	</div>
				                </div>

				                <div class="cc">
				                	<label class="col-sm-2 col-sm-2 control-label">Slogan</label>
				                	<div class="col-sm-10">
				                		<input v-model="slogan" type="text" class="form-control">
				                	</div>
				                </div>
				                <div class="act">
				                	<button @click="addSlogan" type="button" class="btn btn-primary">Thêm</button>
				                	<button type="button" class="btn btn-danger">Hủy</button>
				                
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

<script>
	var addSlogan = new Vue({
		el: '#addSlogan',
		data:{
			author: '',
			description: '',
			slogan: ''
		},
		methods:{
			addSlogan(){
				const fd= new FormData();
				fd.append('aa','ccccc');
				axios.post('/test',fd)
				.then(response=>{
					console.log(response.data);
				})
			}
		}
	})
</script>
