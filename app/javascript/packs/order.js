$(document).on('turbolinks:load', function(){
	var form = $('form')
	var button = $('.create-order')
	form.mouseenter(function(){
		var checkname = $('input[name="order[username]"').val()
		var checkaddress = $('input[name="order[address]"').val()
		var checkphone = $('input[name="order[phone]"').val()
		if (checkname == "" || checkaddress == ""|| checkphone == ""){
			$('.createrorder').attr("disabled", 'disabled');
			$('.info-order').html("<span style = 'color: red'>ban hay nhap day du thong tin de mua hang</span>")
		} 
		else if(checkname != "" && checkaddress != "" && checkphone != ""){
			debugger
			$('.createrorder').removeAttr("disabled", 'disabled');
			$('.info-order').html("<span style = 'color: red'>ban da co the mua hang</span>")
		}
	})
})