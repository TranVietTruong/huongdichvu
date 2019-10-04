
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
			current: 'moinhat',
			url_xemnhieu: '/api/question/xem_nhieu',
			url_votenhieu: '/api/question/vote_nhieu',
			url_trongngay: '/api/question/trong_ngay',
			url_trongtuan: '/api/question/trong_tuan',
			url_trongthang: '/api/question/trong_thang'
		}
	},
	methods: {
		getQuestion()
		{
			axios.post(this.url)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'moinhat';
			})
		},
		FetchPagination(page_number)
		{
			if(this.current == 'moinhat')
			{
				this.url = '/api/question/get_question?page='+page_number;
				this.getQuestion();
			}
			else if(this.current == 'xemnhieu')		
			{
				this.url_xemnhieu = '/api/question/xem_nhieu?page='+page_number;
				this.getQuestionOrderByView();
			}
			else if(this.current == 'votenhieu')
			{
				this.url_votenhieu = '/api/question/vote_nhieu?page='+page_number;
				this.getQuestionOrderByVote();
			}
			else if(this.current == 'trongngay')
			{
				this.url_trongngay = '/api/question/trong_ngay?page='+page_number;
				this.getQuestionInDay();
			}
			else if(this.current == 'trongthang')
			{
				this.url_trongthang = '/api/question/trong_thang?page='+page_number;
				this.getQuestionInMonth();
			}
		},
		getQuestionOrderByView()
		{
			axios.post(this.url_xemnhieu)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'xemnhieu';
			})
		},
		getQuestionOrderByVote()
		{
			axios.post(this.url_votenhieu)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'votenhieu';
			})
		},
		getQuestionInDay()
		{
			axios.post(this.url_trongngay)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'trongngay';
			})
		},
		getQuestionInWeek()
		{
			axios.post(this.url_trongtuan)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'trongtuan';
			})
		},
		getQuestionInMonth()
		{
			axios.post(this.url_trongthang)
			.then(response=>{
				this.listQuestion = response.data.data;
				this.pagination = response.data;
				this.current = 'trongthang';
			})
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
		}
	},
	mounted()
	{
		this.getQuestion();
		this.getTags();
	},
	computed: {
		object: function() {
			return {
				active: this.current == 'moinhat'
			}
		},
		object1: function() {
			return {
				active: this.current == 'xemnhieu'
			}
		},
		object2: function() {
			return {
				active: this.current == 'votenhieu'
			}
		},
		object3: function() {
			return {
				active: this.current == 'trongngay'
			}
		},
		object4: function() {
			return {
				active: this.current == 'trongtuan'
			}
		},
		object5: function() {
			return {
				active: this.current == 'trongthang'
			}
		}
	}

});