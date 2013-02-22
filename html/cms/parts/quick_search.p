
<form action="/search/" method="post" name="quick_search">
<input type="text" id="quick_search_string" name="quick_search_string" value="^if(def $form:quick_search_string){$form:quick_search_string}{Код или название запчасти}" onClick="if(this.value == 'Код или название запчасти'){this.value=''}" onBlur="if(this.value == ''){this.value='Код или название запчасти'}" />
<input type="submit" value="Найти" />
</form>
