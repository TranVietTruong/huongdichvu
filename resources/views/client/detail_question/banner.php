<!-- start banner Area -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					Câu Hỏi				
				</h1>	
				<p class="text-white link-nav"><a href="index.html">Trang Chủ </a>  <span class="lnr lnr-arrow-right"></span>  <a href="category.html"> Câu Hỏi</a></p>


				<form action="search.html" class="serach-form-area">
					<div class="row justify-content-center form-wrap">
						<div class="col-lg-4 form-cols">
							<input type="text" class="form-control" name="search" placeholder="Tìm kiếm">
						</div>
						<div class="col-lg-3 form-cols">
							<div class="default-select" id="default-selects"">
								<select>
									<option value="1">Loại</option>
									<option value="2">Câu hỏi</option>
									<option value="3">Câu trả lời</option>
									<option value="4">Tin tức</option>
								</select>
							</div>
						</div>
						<div class="col-lg-3 form-cols">
							<div class="default-select" id="default-selects2">
								<select>
									<option value="1">Lĩnh vực</option>
									<?php foreach ($this->catagories as $catagory) { ?>
										<option value="2"><?php echo $catagory['name'] ?></option>
									<?php } ?>
								</select>
							</div>										
						</div>
						<div class="col-lg-2 form-cols">
							<button type="button" class="btn btn-info">
								<span class="lnr lnr-magnifier"></span> Tìm kiếm
							</button>
						</div>								
					</div>
				</form>	

			</div>

		</div>
	</div>
</section>
<!-- End banner Area -->	