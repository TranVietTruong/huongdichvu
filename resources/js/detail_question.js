
function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

var slogan = new Vue({
	el: '#app',
	data(){
		return{
			listAnswer: [],
			detailQuestion: {},
			error: [],
			tags:[],
			// --------------------

			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
		get_all_answer_by_id_question()
		{
			let url = location.href.split('/');
			let slug = url[url.length - 1];
			const fd = new FormData();
			fd.append('slug',slug)

			axios.post('/api/question/get_all_answer',fd)
			.then(response=>{
				this.listAnswer = response.data;
			})
			.catch(error=>{
				window.location.href = '/404';
			})
		},
		get_detail_question()
		{
			let url = location.href.split('/');
			let slug = url[url.length - 1];

			const fd = new FormData();
			fd.append('slug',slug)

			axios.post('/api/question/detail_question',fd)
			.then(response=>{
				this.detailQuestion = response.data[0];
			})
			.catch(error=>{
				window.location.href = '/404';
			})
		},
		post_answer()
		{

			let content = CKEDITOR.instances["txtFT_Content"].getData();
			this.error = [];

			if(content == '')
				this.error.push('Bạn chưa nhập câu trả lời');
			else
			{
				let text = CKEDITOR.instances["txtFT_Content"].document.getBody().getText();
				let validate  = text.split(' ');
				console.log(validate.length);
				if(validate.length < 5)
					this.error.push('Câu trả lời của bạn hơi ngắn');
				else
				{
					for(let i=0;i<validate.length;i++)
					{
						if(validate[i].length > 20)
						{
							this.error.push('Câu trả lời của bạn có vẻ chưa nghiêm túc');
							break;
						}
					}
				}
				
			}
			
			if(this.error.length == 0)
			{
				let id_question = $('#id_question').val();
				const fd = new FormData();

				fd.append('id_question',this.detailQuestion.id);
				fd.append('content',content);
				fd.append('tag',this.detailQuestion.tag);

				axios.post('/api/question/add_answer',fd)
				.then(response=>{
					this.listAnswer.push(response.data[0]);
				})
				.catch(error=>{
					thongbao('error',error.response.data);
				})
			}
		},
		update_view()
		{
			setTimeout(() => {

				const fd = new FormData();
				fd.append('id',this.detailQuestion.id);
				
			  	axios.post('/api/question/update_view',fd)
				.then(response=>{
					if(response.data != 'viewed')
						this.detailQuestion.view = parseInt(this.detailQuestion.view) + 1;
				})
				.catch(error=>{
		
				})
			},4000);
		},
		voteQuestion()
		{
			const fd = new FormData();
			fd.append('id_question',this.detailQuestion.id);	
			if(this.detailQuestion.voted == true)
			{
				fd.append('action','disvote');
			}
			else
				fd.append('action','vote');

			axios.post('/api/question/vote',fd)
			.then(response=>{
				if(response.data == 'voted')
				{
					this.detailQuestion.voted = true;
					this.detailQuestion.vote = parseInt(this.detailQuestion.vote) + 1;
				}
				else if(response.data == 'disvoted')
				{
					this.detailQuestion.voted = false;
					this.detailQuestion.vote = parseInt(this.detailQuestion.vote) - 1;
				}
			})
			.catch(error=>{
				thongbao('error',error.response.data);
			})
		},
		voteAnswer(answer)
		{
			const fd = new FormData();
			fd.append('id_answer',answer.id);	

			if(answer.voted == true)
			{
				fd.append('action','disvote');
			}
			else
				fd.append('action','vote');


			axios.post('/api/question/vote_answer',fd)
			.then(response=>{
				if(response.data == 'voted')
				{
					answer.voted = true;
					answer.vote = parseInt(answer.vote) + 1;
				}
				else if(response.data == 'disvoted')
				{
					answer.voted = false;
					answer.vote = parseInt(answer.vote) - 1;
				}
			})
			.catch(error=>{
				thongbao('error',error.response.data);
			})
		},
		getTags()
		{
			axios.post('/api/user/get_tag')
			.then(response=>{
				this.tags = response.data;
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
		this.get_detail_question();
		this.get_all_answer_by_id_question();
		this.update_view();
		this.getTags();

	}

});