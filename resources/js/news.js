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
	el: '#news',
	data(){
		return{
			listNews: [],
			url: '/api/news/get_news',
			pagination: {},
			keyword: ''
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
		}
	},
	mounted(){
		this.get_news();
	}

});