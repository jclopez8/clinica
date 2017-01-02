/**
 * 
 */

function ingresarPaciente(id){
	//alert("ingresar Pacienteeee..."+id);
	document.getElementById("citasId").value=id;
	document.ingresarPacienteForm.submit();
}

function quitarTratamiento(citaId,tratamientoId){
//	alert("deleting trata from: "+citaId+" TratId: "+tratamientoId);
	document.getElementById("citaToChange").value=citaId;
	document.getElementById("tratamientoDeleted").value=tratamientoId;
	document.ingresarPacienteForm.method="POST";
	document.ingresarPacienteForm.action="/clinicaweb/quitar/tratamientoIngresar";
	document.ingresarPacienteForm.submit();
}


function showChangeStatusIngrWindow(url){
	newwindow=window.open(url,'name','height=200,width=500');
	if (window.focus) {newwindow.focus();}

	return false;
}
