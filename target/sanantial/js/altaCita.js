/**
 * 
 */


function guardarCita(){
	//alert("guadar cita");
	if(validNonEmptyFieldsCita()){
		document.altaCitaForm.submit();
	}
}


function validNonEmptyFieldsCita(){
	
	if(document.getElementById('fecha').value==="" ){
		alert("Favor de teclear una fecha");
		document.getElementById('fecha').focus();
		return false;
	}
	return true;
}


//window.onload = function () { 
//	
//	resetForm(document.altaCitaForm);
//	  	    
//};