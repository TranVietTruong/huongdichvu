var app = new Vue({
	el: '#app',
	data(){
		return{
			keyword: '',

			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
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
				console.log(response.data);
			})
			.catch(error=>{
				thongbao('error',error.response.data);
			})
		},
		search(){
			
		}
	}

});