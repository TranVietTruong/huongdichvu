
//  const dictionary = {
// 	custom: {
// 		title: {
// 			required: () => 'Tiêu đề không được để trống',
// 			max: () => 'Tiêu đề không hợp lệ',
// 			min: () => 'Tiêu đề không hợp lệ',
// 		},
	
		
// 	}
// };
// VeeValidate.Validator.localize('en',dictionary);
// Vue.use(VeeValidate);

function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

var app = new Vue({
	el: '#app',
	data(){
		return{
			title:'',
			tag: '',
			tags: [],
			items: [], // danh sách tag gợi ý
			error: [],
			maxLength: 50, // Số lượng độ dài tối đa của 1 tag,

			// --------------------
			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
		register(){
			let major = $('#major').val();
			let content = CKEDITOR.instances["txtFT_Content"].getData();

			this.error = [];
			if(major == '')
				this.error.push('Chọn một lĩnh vực mà bạn quan tâm.');
			if(this.title == '')
				this.error.push('Hãy đặt tiêu đề cho câu hỏi của bạn.');
			if(this.title.length > 253)
				this.error.push('Tiêu đề của bạn quá dài');
			if(this.tags.length == 0)
				this.error.push('Hãy thêm tối thiểu 1 thẻ tag.');
			if(content == '')
				this.error.push('Nội dung bạn muốn hỏi là gì ?');
			
			if(this.error.length == 0)
			{
				let tags = this.tags.map((item) => { return item.text});
				console.log(tags);

				const fd = new FormData();
				fd.append('major',major);
				fd.append('title',this.title);
				fd.append('tags[]',tags);
				fd.append('content',content);

				axios.post('/api/question/post_question',fd)
				.then(response=>{
					thongbao("success","Câu hỏi đã được đăng");
					$('#major').val(null);
					CKEDITOR.instances["txtFT_Content"].setData('');
					this.tags = [];
					this.title = '';

				})
				.catch(error=>{
					thongbao("error",'Không thể đăng câu hỏi');
				})
			}

		},
		getTag()
		{
			axios.post('/api/tag/get_all')
			.then(response=>{

				for(let i=0;i<response.data.length;i++)
				{
					this.items.push({'text':response.data[i].name});
				}
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
	computed: {
		filteredItems() {
			return this.items.filter(i => {
				return i.text.indexOf(this.tag) !== -1;
			});
		}
	},
	mounted()
	{
		this.getTag();
	}

});