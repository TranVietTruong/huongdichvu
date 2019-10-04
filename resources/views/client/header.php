<header id="header" id="home">
	<div class="container">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="index.html"><img src="public/client/img/logo1.png" alt="" title="" /></a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li class="menu-active"><a href="/">Trang Chủ</a></li>
					<li><a href="/cau-hoi">Câu Hỏi</a></li>
					<li><a href="/tin-tuc">Tin Tức</a></li>
					<li><a href="/gioi-thieu">Giới Thiệu</a></li>
					<li><a href="/lien-he">Liên Hệ</a></li>
					

					<?php if(isset($_SESSION['user'])) { ?>
						<li><a class="ticker-btn" href="dat-cau-hoi">Đặt Câu Hỏi</a></li>
					<?php } ?>
					

					<?php if(!isset($_SESSION['user'])) { ?>
						<li><a class="ticker-btn" href="/dang-ky">Đăng ký</a></li>
					<?php } ?>
					
					<?php if(!isset($_SESSION['user'])) { ?>
					<li><a class="ticker-btn" href="/dang-nhap">Đăng nhập</a></li>
					<?php } ?>

					<?php if(isset($_SESSION['user'])) { ?>
						<li><a class="ticker-btn" href="/user"><span style="font-size: 16px;" class="fa fa-user"></span></a></li>
					<?php } ?>

					<?php if(isset($_SESSION['user'])) { ?>
						<li><a class="ticker-btn" href="/dang-xuat">Đăng Xuất</a></li>
					<?php } ?>

				</ul>
			</nav><!-- #nav-menu-container -->		    		
		</div>
	</div>
</header><!-- #header -->