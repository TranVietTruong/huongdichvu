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
	el: '#app',
	data(){
		return{
			listQuestion: [],
			tags: [],
			url: '/api/question/get_by_category',
			pagination: {},
	
			// -----------------------
			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
		getQuestion()
		{
			let url = location.href.split('/');
			let slug = url[url.length - 1];
			const fd = new FormData();
			fd.append('slug',slug)

			axios.post(this.url,fd)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
			})
			.catch(error=>{
				window.location.href = '/404';
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/question/get_by_category?page='+page_number;
			this.getQuestion();
		},
		getTags()
		{
			axios.post('/api/user/get_tag')
			.then(response=>{
				this.tags = response.data;
			})
		},
		share(url)
		{
			Swal.fire({
				input: 'text',
				inputValue: url,
				inputAttributes: {
					readonly: false,
				},
				showConfirmButton: false
			})
		},
		intanceSearch()
		{
			if(this.keysearch == '')
			{
				this.searchs = [];
				this.questions = [];
				this.news = [];
				return;
			}	

			let species = $("#species").val();
			let category = $("#category").val();

			const fd = new FormData();
			fd.append('species',species);
			fd.append('category',category);
			fd.append('keysearch',this.keysearch);

			axios.post('/api/search/keyword',fd)
			.then(response=>{
				this.searchs = response.data.searchs;
				this.questions = response.data.questions;
				this.news = response.data.news;
			})
			.catch(error=>{
				thongbao('error',error.response.data);
			})
		}
	},
	mounted()
	{
		this.getQuestion();
		this.getTags();
	}

});