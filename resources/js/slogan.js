
const dictionary = {
	custom: {
		author: {
			required: () => 'Tên tác giả không được để trống',
			max: () => 'Tên tác giả không hợp lệ',
		},
		image:{
			required: () => 'Hình ảnh không được để trống',
			image: () => 'Tệp đã chọn không phải hình ảnh'
		},
		description: {
			required: () => 'Mô tả không được để trống',
			max: () => 'Dữ liệu không hợp lệ'
		},
		slogan: {
			required: () => 'Slogan này không được để trống'
		}
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);

var addSlogan = new Vue({
		el: '#main-content',
		data:{
			author: '',
			description: '',
			slogan: ''
		},
		methods:{
			addSlogan(){
				this.$validator.validate().then(valid=>{
					if(valid)
					{
						let image = document.getElementById('image').files[0];

						const fd = new FormData();
						fd.append('author',this.author);
						fd.append('image',image);
						fd.append('description',this.description);
						fd.append('slogan',this.slogan);

						axios.post('/api/slogan/add',fd)
						.then(response=>{
							Swal.fire({
								toast: true,
								position: 'top-end',
								type: 'success',
								title: 'Thêm thành công',
								showConfirmButton: false,
								timer: 3000
							})
						})
						.catch(error=>{
							Swal.fire({
								toast: true,
								position: 'top-end',
								type: 'error',
								title: error.response.data,
								showConfirmButton: false,
								timer: 3000
							})
						})
					}
				});
			}
		}
	})