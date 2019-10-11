<!--footer start-->
	<footer class="site-footer">
		<div class="text-center">
			<p>
				&copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
			</p>
			<div class="credits">
				Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
			</div>
			<a href="index.html#" class="go-top">
				<i class="fa fa-angle-up"></i>
			</a>
		</div>
	</footer>
<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="public/admin/lib/jquery/jquery.min.js"></script>

<script src="public/admin/lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="public/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="public/admin/lib/jquery.scrollTo.min.js"></script>
<script src="public/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="public/admin/lib/jquery.sparkline.js"></script>
<!--common script for all pages-->
<script src="public/admin/lib/common-scripts.js"></script>
<!--script for this page-->
<script src="public/admin/lib/zabuto_calendar.js"></script>
<script src="public/admin/vue.js"></script>
<script src="public/admin/vuejs-paginate.js"></script>
<script src="public/admin/vee-validate.js"></script>
<script src="public/admin/axios.min.js"></script>
<script src="public/admin/sweetalert.js"></script>
<?php if(isset($this->js)) echo $this->js; ?>


<script type="application/javascript">
	$(document).ready(function() {
		$("#date-popover").popover({
			html: true,
			trigger: "manual"
		});
		$("#date-popover").hide();
		$("#date-popover").click(function(e) {
			$(this).hide();
		});

		$("#my-calendar").zabuto_calendar({
			action: function() {
				return myDateFunction(this.id, false);
			},
			action_nav: function() {
				return myNavFunction(this.id);
			},
			ajax: {
				url: "show_data.php?action=1",
				modal: true
			},
			legend: [{
				type: "text",
				label: "Special event",
				badge: "00"
			},
			{
				type: "block",
				label: "Regular event",
			}
			]
		});
	});

	function myNavFunction(id) {
		$("#date-popover").hide();
		var nav = $("#" + id).data("navigation");
		var to = $("#" + id).data("to");
		console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
	}

	$("#logout").click(function(event) {
		$.ajax({
			url : "/api/admin/logout",
			type : "post",
			dataType:"html",
			data: {
			},
			success : function (result){
				window.location.href = '/admin/login';
			}
		});
	});
</script>
</body>

</html>
