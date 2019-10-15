const dictionary = {
	custom: {
		link: {
			required: () => 'Đường dẫn không hợp lệ',
			max: () => 'Đường dẫn không hợp lệ',
		},
		sites: {
			required: () => 'Yêu cầu chọn trang'
		},
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);

function thongbao(type,message)
{
	Swal.fire({
        type: type, //success, info, error, // WARNING
        title: 'Thông báo',
        text: message,
    })
}

function thongbao2(type,message)
{
	Swal.fire({
        type: type,
        text: message,
        showConfirmButton: false,
    })
}

Vue.component('paginate', VuejsPaginate)

var app = new Vue({
	el: '#app',
	data(){
		return{
			listNews: [],
			sites: ['www.brandsvietnam.com', 'www.khoinghiepvietnam.org', 'www.khoi.nghiep.vn'],
			message: '',
			url: '/api/news/get_news',
			pagination: {},
			keyword: '',
			from_site: '',
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
			const fd = new FormData();
			fd.append('link', this.link);
			fd.append('from_site', this.from_site);

			if(this.link.split("/")[2] != this.from_site)
			{
				thongbao('error', 'Thiếu trang đích');
			}
			else {
				thongbao('success', 'Thêm thành công!');
				axios.post('/api/news/add', fd)
				.then(response=>{
						// this.message = response.data;
				});

				this.link = "";
				this.from_site = "";
			}
		}
	},
	mounted(){
		this.get_news();
	}

});
