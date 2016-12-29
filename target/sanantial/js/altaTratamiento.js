/**
 * 
 */


window.onload = function () { 
	resetForm(document.altaTratamientoForm);
	  	    
};


function guardarTratamiento(){
	//alert("guardar tratamiento...");
	if(validNonEmptyFieldsTratamiento() && validateInputsForm(document.altaTratamientoForm)){
		document.altaTratamientoForm.submit();
	}
}



function validNonEmptyFieldsTratamiento(){
	
	if(document.getElementById('tratamientoNombre').value==="" ){
		alert("Favor de capturar un nombre");
		document.getElementById('medicamentoNombre').focus();
		return false;
	}else if(document.getElementById('precio').value===""){
		alert("Favor de capturar un precio");
		document.getElementById('precio').focus();
		return false;
	}
	return true;
}