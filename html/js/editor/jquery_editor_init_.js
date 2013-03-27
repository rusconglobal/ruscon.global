$(function()
{
	var config = {
		filebrowserBrowseUrl: "/js/ckfinder/ckfinder.html",
		filebrowserImageBrowseUrl: "/js/ckfinder/ckfinder.html?type=Images",
		filebrowserFlashBrowseUrl: "/js/ckfinder/ckfinder.html?type=Flash",
		filebrowserUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Files",
		filebrowserImageUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Images",
		filebrowserFlashUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Flash",
		filebrowserWindowWidth: "1000",
		filebrowserWindowHeight: "700",

		skin : 'office2003',
		toolbar:
		[
			['Source','-','Undo','Redo','-','Cut','Copy','Paste','PasteText','PasteFromWord','-'],
			['Find','Replace','-','SelectAll','RemoveFormat','ShowBlocks'],
			'/',
			['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			['Link','Unlink','Anchor'],
			['Image','Youtube','Table','HorizontalRule','SpecialChar'],
			'/',
			['Font','FontSize'],
			['TextColor','BGColor']
		]
	};
	var config_basic = {
		filebrowserBrowseUrl: "/js/ckfinder/ckfinder.html",
		filebrowserImageBrowseUrl: "/js/ckfinder/ckfinder.html?type=Images",
		filebrowserFlashBrowseUrl: "/js/ckfinder/ckfinder.html?type=Flash",
		filebrowserUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Files",
		filebrowserImageUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Images",
		filebrowserFlashUploadUrl: "/js/ckfinder/core/connector/aspx/connector.php?command=QuickUpload&type=Flash",
		filebrowserWindowWidth: "1000",
		filebrowserWindowHeight: "700",

		skin : 'office2003',
		toolbar:
		[
			['Source','-','Undo','Redo','-','Cut','Copy','Paste','PasteText','PasteFromWord','-'],
			'/',
			['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			['Image','Link','Unlink']
		]
	};
	
	config.extraPlugins = 'youtube';
	config.toolbar.push(['youtube']);

	// Initialize the editor.
	// Callback function can be passed and executed after full instance creation.
	$('.jquery_ckeditor').ckeditor(config);
	$('.jquery_ckeditor_basic').ckeditor(config_basic);

});
