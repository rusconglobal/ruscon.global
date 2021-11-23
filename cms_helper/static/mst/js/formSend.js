$(document).ready(function () {

	const delMessage = function () {
		 setTimeout(function() {
			   $('.js-success').text('');
			}, 4000);
	}

    $("#send-form").submit(function() {
	    var url = "/helper/writetous/";
		const formDataArray = $("#send-form").serializeArray();
		var data = `${$("#send-form").serialize()}&formPolicy=Y`;

		if (!formDataArray.find(function (el) {
			return el.name === 'agree';
		})) {
			data += '&agree=off';
		}

	    $.ajax({
		   type: "POST",
		   url: url,
		   data,
		   success: function(data) {
			   if (data.result === 1) {
				   $('.js-success').text('Ваше сообщение успешно отправлено!');
			   } else {
				   $('.js-success').text('Сообщение не отправлено, данные указаны некорректно!');
			   }
			  delMessage();
		   },
		   error: function(data) {
			   $('.js-success').text('Сообщение не отправлено, данные указаны некорректно!');
			 delMessage();
			   //Materialize.toast('Произошла ошибка при отправке сообщения!', 3000, 'toast-error');
		   }
	 	});

	    return false;
	});
});