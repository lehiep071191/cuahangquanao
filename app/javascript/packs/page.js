$(document).on('turbolinks:load', function(){
	var disable = $('.dathang')
	disable.each(function(index,value){
		$(this).on('mouseenter',function(){
			debugger
			var id = $(this).data('id')
			if ($('#test-'+ id).text() == "ban da co mon hang nay trong gio hang"){
				$('#addcart'+id).attr("disabled","disabled")
				alert('ban da dat mua mon hang nay , hay kiem tra lai trong gio hang')
			}

		})
	})
})