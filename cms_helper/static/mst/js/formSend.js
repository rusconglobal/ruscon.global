$(document).ready(function () {

	const delMessage = function () {
		 setTimeout(function() {
			   $('.js-success').text('');
			   $('.js-success').removeClass('error-message');
			   $('.js-success').removeClass('compl-message');
			}, 4000);
	}
	function clearForm($form)
	{
		$form.find(':input').not(':button, :submit, :reset, :hidden, :checkbox, :radio').val('');
		$form.find(':checkbox, :radio').prop('checked', false);
		$(".anon-name").removeClass("blocking");
		$(".anon-email").removeClass("blocking");
		$(".anon-phone").removeClass('blocking');
	}
	$("#id_anonim").click(function() {
		var checked_status = this.checked;
		if (checked_status === true) {
			$(".anon-name").find(':input').val('Anonim');
			$(".anon-name").addClass('blocking');
			$(".anon-email").find(':input').val('Anonim@anonim.ru');
			$(".anon-email").addClass('blocking');
			$(".anon-phone").find(':input').val('+7(999)999-99-99');
			$(".anon-phone").addClass('blocking');
		} else {
			$(".anon-name").find(':input').val('');
			$(".anon-name").removeClass("blocking");
			$(".anon-email").find(':input').val('');
			$(".anon-email").removeClass("blocking");
			$(".anon-phone").find(':input').val('');
			$(".anon-phone").removeClass('blocking');
		}
	});
	$("#id_agree").click(function() {
		var checked_status = this.checked;
		if (checked_status === true) {
		   $(".form-send__button").removeClass("visibl");
		} else {
		   $(".form-send__button").addClass('visibl');
		}
	});

    $("#send-form").submit(function() {
	    var url = "/helper/writetouspolitics/";
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
				   $('.js-success').addClass('compl-message')
				   clearForm($("#send-form"))

			   } else {
				   $('.js-success').text('Сообщение не отправлено, данные указаны некорректно!');
				   $('.js-success').addClass('.error-message')
			   }
			  delMessage();
		   },
		   error: function(data) {
			   $('.js-success').text('Сообщение не отправлено, данные указаны некорректно!');
			   $('.js-success').addClass('.error-message');
			   delMessage();
			   //Materialize.toast('Произошла ошибка при отправке сообщения!', 3000, 'toast-error');
		   }
	 	});

	    return false;
	});
});