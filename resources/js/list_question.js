
function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

Vue.component('paginate', VuejsPaginate)

var slogan = new Vue({
	el: '#list-question',
	data(){
		return{
			listQuestion: [],
			tags: [],
			url: '/api/question/get_question',
			pagination: {},
			option: 1
		}
	},
	methods: {
		getQuestion()
		{
			axios.post(this.url)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/question/get_question?page='+page_number;
			this.getQuestion();		
		},
		getTags()
		{
			axios.post('/api/user/get_tag')
			.then(response=>{
				console.log(response.data);
				this.tags = response.data;
			})
		},
	},
	mounted()
	{
		this.getQuestion();
		this.getTags();
	}

});