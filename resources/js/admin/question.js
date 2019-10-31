function confirmSweet(message, callBack)
{
	Swal.fire({
  title: message,
  text: "Bạn sẽ không thể hoàn tác hành động này!",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
	cancelButtonText: "Thoát",
  confirmButtonText: 'Xóa'
	}).then((result) => {
	  if (result.value) {
	    callBack();
	  }
	});
}


function thongbao(type,title)
{
	Swal.fire({
		type: type,
		title: title,
		showConfirmButton: false,
		timer: 3000
	})
}

Vue.component('paginate', VuejsPaginate);

var question = new Vue({
	el: '#app',
	data:{
		url: '/api/question/get_question',
		pagination: {},
		question: '',
		listQuestion: []
	},
	methods:{
		get_question(){
			axios.post('/api/question/get_question')
			.then(response=>{
				// for(let i=0;i<response.data.data.length;i++)
				// {
				// 	console.log("Có dữ liệu");
				// 	if(response.data.data[i].active == 1)
				// 		response.data.data[i].active = true;
				// 	else
				// 		response.data.data[i].active = false;
				// }
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				console.log(response.data);
			});
		},
		updateActive(question)
		{
			const fd = new FormData();
			fd.append('id',question.id);
			axios.post('/api/question/update_active',fd)
			.then(response=>{
				question.active = !question.active;
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/news/get_question?page='+page_number;
			this.get_question();
		},
		removeQuestion(question)
		{
			confirmSweet("Bạn có muốn câu hỏi này?", function(){
				Swal.fire(
		      'Đã xóa!',
		      'Bạn vừa xóa',
		      'success'
		    );

				const fd = new FormData();
				fd.append('id',question.id);
				axios.post('/api/question/remove',fd)
				.then(response=>{
					window.location="/admin/question";
				});
			});
		}
	},
	mounted()
	{
		this.get_question();
	}
});
