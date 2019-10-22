<aside>
	<div id="sidebar" class="nav-collapse ">

		<!-- sidebar menu start-->
		<ul class="sidebar-menu" id="nav-accordion">
			<p class="centered"><a href="profile.html"><img src="public/admin/img/ui-sam.jpg" class="img-circle" width="80"></a></p>
			<h5 class="centered"><?php if(isset($_SESSION['admin'])) echo $_SESSION['admin']['full_name'] ?></h5>
			<li class="sub-menu">
				<a href="/admin">
					<i class="fa fa-home"></i>
					<span>Tổng quan</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="/admin/slogan">
					<i class="fa fa-asterisk"></i>
					<span>Slogan</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="/admin/catagory">
					<i class="fa fa-tasks"></i>
					<span>Danh mục</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="javascript:;">
					<i class="fa fa-question"></i>
					<span>Câu hỏi</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="/admin/news">
					<i class="fa fa-coffee"></i>
					<span>Tin tức</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="/admin/users">
					<i class="fa fa-users"></i>
					<span>Users</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="javascript:;">
					<i class="fa fa-unlock-alt"></i>
					<span>Tài khoản</span>
				</a>
			</li>
			<li class="sub-menu">
				<a href="javascript:;">
					<i class="fa fa-user"></i>
					<span>Thông tin cá nhân</span>
				</a>
			</li>
		</ul>
		<!-- sidebar menu end-->
	</div>
</aside>
