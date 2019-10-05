<section class="blog-posts-area section-gap" id="news">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 post-list blog-post-list detail_news">
				<?php
					$html = file_get_html($this->url);
					$content = $html->find($this->post, 0);
					echo $content; ?>

				<div class="fb-comments" data-href="http://huongdichvu.com:8888/tin-tuc/<?php echo $this->news[0]['slug'] ?>" href="http://huongdichvu.com:8888/tin-tuc/<?php echo $this->news[0]['slug'] ?>" data-width="100%" data-numposts="10"></div>
			</div>
		
