$(document).ready(function(){
	$('.create_comment').click(function(){
		var content = $('textarea[name="giatritext"').val()
		var	count_comment = parseInt($('#count-comment').text())
		if (content.includes("dit") || content.includes("địt") || content.includes("dit") || content.includes("me may") || content.includes("mẹ mày") || content.includes("con me") || content.includes("dcm")|| content.includes("đcm")) 		
		{
			$('textarea[name="giatritext"').val("")
			$('#noitice-alert').html('<span style = "color:red">xin vui lòng điều chỉnh lại ngôn ngữ cho phù hợp</span>')
			setTimeout(function(){$('#noitice-alert').html("");}, 5000);
		}else{	
			$.ajax({
				url: '/comments',
				type: 'post',
				dataType: 'json',
				data: {
					content: $('textarea[name="giatritext"').val(),
					product_id: $('input[name="product_id"]').val(),
					user_id: $('input[name="user_id"]').val() 
				}, 
				success: function(data){
					count_comment = count_comment + 1
					$('#count-comment').html(count_comment)
					$('.append-comment').append(data.data_comment)
					$('textarea[name="giatritext"').val("")
					$('#noitice-alert').html("")
				} 
			})
		}
	})
})