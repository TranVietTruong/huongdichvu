const dictionary = {
	custom: {
		link: {
			required: () => 'Đường dẫn không hợp lệ',
			max: () => 'Đường dẫn không hợp lệ',
		}
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);

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
			preview: '',
			hasPreview: false,
			link: ''
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
		removeNews(news)
		{
			const fd = new FormData();
			fd.append('id', news.id);
			axios.post('/api/news/remove',fd)
			.then(response=>{
				this.listNews.splice(this.listNews.indexOf(news),1);
			})
		},
		addNews()
		{

		},
		changeLink(event)
		{
			this.link = event.target.value;
			const fd = new FormData();
			fd.append('link', this.link);

			axios.post('/api/news/preview', fd)
			.then(response=>{
				this.preview = response.data;
				this.hasPreview = true;
				// console.log(this.preview);
			});

		}
	},
	mounted(){
		this.get_news();
	}

});
