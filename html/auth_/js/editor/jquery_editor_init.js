$(function()
{
	var config = {
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
			['Image','Table','HorizontalRule','SpecialChar'],
			'/',
			['Font','FontSize'],
			['TextColor','BGColor']
		]
	};

	// Initialize the editor.
	// Callback function can be passed and executed after full instance creation.
	$('.jquery_ckeditor').ckeditor(config);

});
