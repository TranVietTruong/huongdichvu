
function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

var slogan = new Vue({
	el: '#list-question',
	data(){
		return{
			listQuestion: [],
			tags: []
		}
	},
	methods: {
		getQuestion()
		{
			axios.post('/api/question/get_question')
			.then(response=>{
				
				this.listQuestion = response.data;
			})
		},
		getTags()
		{
			axios.post('/api/tag/get_all')
			.then(response=>{
				
				this.tags = response.data;
			})
		}
	},
	mounted()
	{
		this.getQuestion();
		this.getTags();
	}

});