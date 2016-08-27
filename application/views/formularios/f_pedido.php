<script src="../../js/f_pedido.js"></script>
<div id="seccionformulario" class="formulario">
<div class="titulo_form">ORDERS</div><br>
<table cellpadding=3 width="250" border=0>
<form id="form_cliente" autocomplete = off>
<tr><th colspan=2>Package information</th></tr>

<tr><td>
<label for "select_empaque">Box:</label>
<select name="f_empaque" id="_s_empaque">
	
	<?php foreach ($empaques as $empq_item) 
     		echo '<option value='.$empq_item['nombre'].'>'.$empq_item['nombre'].'</option>';?>
</select>
</td>
<td>
<label for "input_piezas">Pieces:</label>
<input name="f_piezas" type="numeric" id="_i_piezas" data-toggle="tooltip" title="Number of boxes" size=4 value=1></input>
</td>
</tr>
<tr><td colspan=2> <button id= "_i_addbox">Add Box</button></td></tr>
<tr><td colspan=2><hr></td></tr>
<tr class="seccion_prods" ><th colspan=2>Product information</th></tr>

<tr class="seccion_prods" ><td colspan=2>
<label for "select_producto">Product:</label>
<select name="f_producto" id="_s_producto" class="producto">
	<option value="" selected></option> 
	<?php foreach ($productos as $prod_item)
     		echo '<option value="'.$prod_item['producto'].'+'.$prod_item['dimension'].'">'.$prod_item['producto'].'</option>';?>
</select>
</tr></td>
<tr class="seccion_prods" ><td>
<label for "select_longitud" class="select_longitud" >Length:</label>
<select name="f_longitud" class="select_longitud" id= _s_longitud >
	<option value="" selected></option> 
	<?php foreach ($longitudes as $longitud_item) 
     		echo '<option value='.$longitud_item['valor'].'>'.$longitud_item['valor'].' cm'.'</option>';?>
</select>

<label for "select_empaque" class="select_peso">Weight:</label>
<select name="f_peso" class="select_peso" id= _s_peso>
	<option value="" selected></option> 
	<?php foreach ($pesos as $peso_item) 
     		echo '<option value='.$peso_item['valor'].'>'.$peso_item['valor'].' gr'.'</option>';?>
</select>
</td><td>
<label for "select_corte" class="select_corte" class="noblock">Cut Stage:</label>
<select name="f_corte" class="select_corte" class="noblock" id= _s_corte>
	<option value="" selected></option>
	<option value="USA">USA</option>
	<option value="Europe">Europe</option>
	<option value="Russia">Russia</option> 
</select>
</td></tr>
<tr class="seccion_prods" >
<td>
<label for "input_bunches">Bunches:</label>
<input name="f_bunches" type="numeric" id="_i_bunches" data-toggle="tooltip" title="Number of bunches" size=6></input>
</td>
<td>
<label for "input_uxbunch">Qty x Bunch:</label>
<input name="f_uxbunch" type="numeric" id="_i_qxbunch" data-toggle="tooltip" title="Number of units per bunch" size=6 value=25></input>
</td>
</tr>
<tr class="seccion_prods" >
<td rowspan=2>
<label for "input_eprice">Estimated price:</label>
<input name="f_eprecio" type="numeric" id="_i_eprecio" data-toggle="tooltip" title="We can use this value in searching for your product. It is a reference price." size=6 ></input>

<input type="radio" name="tipo_precio" value="perStem" class="noblock" id=_r_tprecio1 checked>Stem</input>
<input type="radio" name="tipo_precio" value="perBunch" class="noblock" id= _r_tprecio2>Bunch</input>
</td>
<td>
<label for "input_uxcaja">Qty x Box:</label>
<input name="f_uxcaja" type="numeric" id="_i_qxbox" data-toggle="tooltip" title="Number of bunches per box" size=6 value=8></input>

</td>
</tr>

<td>
<tr class="seccion_prods" ><td colspan=2> <button id = "_i_addproduct" >Add Product</button> </td></tr>




<tr class="seccion_prods" ><td colspan=2><hr></td></tr>
<tr class="seccion_prods" ><th colspan=2>Additional information</th></tr>

<tr class="seccion_prods" ><td colspan=2>
<label for "input_fecha">Fly Date:</label>
<input type="text" name="f_fecha" id="_i_fecha"></input>
</td></tr>


<tr class="seccion_prods" ><td colspan=2><button id = "_i_adinformation" >Aditional Information</button></td></tr>

</form>


</table>
</div>

<div id="seccionpedido">
<table id="tablapedido" width=900px>
<tr id="f0">
<th class= "ttp" width="25">Item</th><th class="ttp">Boxes</th><th class="ttp">Package</th><th class="ttp">Pieces</th><th class="ttp" width="280">Product</th><th class="ttp">long/wgt</th><th class="ttp">Cut Stage</th><th class="ttp">Bunches</th><th class="ttp">QxBunch</th><th class="ttp">E.Price</th><th class="ttp">B/S</th><th class="ttp"></th>
</tr>
</table>

</div>

<div id="campo_editable"><form autocomplete=off>
<input name="f_uxcaja" type="numeric" id="txt_editable"  size=6 value=0></input>
<button class="button_tooltip" id="bt_ok" size=6>OK</button>
<button class="button_tooltip" id="bt_cancel" size=6>X</button>
</form></div>


