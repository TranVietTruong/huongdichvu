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
			axios.post(this.url)
			.then(response=>{

				for(let i=0;i<response.data.data.length;i++)
				{
					if(response.data.data[i].active == 1)
						response.data.data[i].active = true;
					else
						response.data.data[i].active = false;

					response.data.data[i].show = false;
					response.data.data[i].answers = [];
				}

				this.listQuestion = response.data.data;
				this.pagination = response.data;

				for(let i=0;i<response.data.data.length;i++)
				{
					this.get_all_answer_by_id_question(response.data.data[i]);
				}


			});
		},
		updateActive(question)
		{
			const fd = new FormData();
			fd.append('id',question.id);
			axios.post('/api/question/updateActive',fd)
			.then(response=>{
				question.active = !question.active;
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/question/get_question?page='+page_number;
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
		},
		show(question)
		{
			if(question.answers.length==0)
			{
				alert("Câu hỏi này chưa có câu trả lời nào!");
			}
			else {
				question.show = !question.show;
			}
		},
		get_all_answer_by_id_question(question)
		{
			let slug = question.slug;
			const fd = new FormData();
			fd.append('slug',slug)

			axios.post('/api/question/get_all_answer',fd)
			.then(response=>{
				// if(response.data.length>0)
				// {
					for(let i=0; i<response.data.length; i++)
					{
						if(response.data[i].active == 1)
							response.data[i].active = true;
						else
							response.data[i].active = false;
					}
					var index = this.listQuestion.indexOf(question);
					this.listQuestion[index].answers = response.data;
					console.log(this.listQuestion[index].answers[0].full_name);
				// }
				// else{
				// 	console.log("None");
				// }
			})
			.catch(error=>{
				// window.location.href = '/404';
				alert(error.response.data);
			});
		},
		updateActive_ans(answer){
			const fd = new FormData();
			fd.append('id',answer.id);
			axios.post('/api/answer/updateActive',fd)
			.then(response=>{
				answer.active = !answer.active;
			})
		},
		removeAnswer(question,answer){
			const fd = new FormData();
			fd.append('id',answer.id);
			axios.post('/api/answer/remove',fd)
			.then(response=>{
				question.answers.splice(question.answers.indexOf(answer),1);
				thongbao("success","Đã xóa!");
			});
		}
	},
	mounted()
	{
		this.get_question();
	}
});
