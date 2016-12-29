/**
 * 
 */

function guardarPaciente(){
	alert('guardar paciente....');
	if(validNonEmptyFieldsPaciente() && validateInputsForm(document.altaPacienteForm)){
	  document.altaPacienteForm.submit();
	}
}


window.onload = function () { 
	resetForm(document.altaPacienteForm);
	  	    
};

function validNonEmptyFieldsPaciente(){
	
	if(document.getElementById('pacienteNombre').value==="" ){
		alert("Favor de capturar un nombre");
		document.getElementById('pacienteNombre').focus();
		return false;
	}else if(document.getElementById('apellidoPaterno').value===""){
		alert("Favor de capturar un apellido");
		document.getElementById('apellidoPaterno').focus();
		return false;
	}
	return true;
}