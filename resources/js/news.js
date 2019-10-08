function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

Vue.component('paginate', VuejsPaginate)

var app = new Vue({
	el: '#app',
	data(){
		return{
			listNews: [],
			url: '/api/news/get_news',
			pagination: {},
			keyword: '',

			// ---------------
			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
		get_news()
		{
			axios.post(this.url)
			.then(response=>{
				this.listNews = response.data.data;
				this.pagination = response.data;
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/news/get_news?page='+page_number;
			this.get_news();
		},
		search()
		{
			const fd =new FormData();
			fd.append('keyword',this.keyword);
			axios.post('/api/news/search',fd)
			.then(response=>{
				this.listNews = response.data;
				this.pagination.last_page = 1;
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
	mounted(){
		this.get_news();
	}

});
