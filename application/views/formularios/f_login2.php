<div id = "form_login" class= "cform_login">

	
	<h2 class = "cform_login" >LOGIN TO PLACE YOUR ORDER (Wrong Password!)</h2>
		<form method = post action = "login"  >
		<label for "input_usuario" class = "cform_login">User email:</label>
		<input type = "text" class ="cform_login texto2" id = "idinput_usuario" name = "input_usuario" size = 35></input>
		<br><label for "input_usuario" class = "cform_login">Password:</label>
		<input type = "password" class ="cform_login texto2" id = "id_input_password" name= "input_password" size = 35></input>
		<br><input type = "checkbox" class ="cform_login" id = "id_recordar_sesion" name = "recordar_sesion"></input>
		<label for "recordar_sesion" class = "cform_login texto2">Keep session open</label>
		<div id = "login_buttons">
			<br><button id = "aceptar_login" class ="cform_login">Submit</button>
			<button id = "borrar_login" class ="cform_login">Reset</button>	
		</div>
	</form>
</div>
