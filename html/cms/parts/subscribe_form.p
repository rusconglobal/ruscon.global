<div id="subscribe_form_div">
<form action="$request:uri" method="post" name="subscribe_email" id="subscribe_email" onSubmit="submit_email( ^$('#email_to_subscribe').val() )^; return false^;">
	<input type="text" name="email_to_subscribe" id="email_to_subscribe" /><input type="image" name="submit_subscribe_form" id="submit_subscribe_form" src="{template}pics/button_ok.gif" width="28" height="26" title="OK" />
</form>
</div>
