/**
 * 
 */


window.onload = function () { 
	resetForm(document.altaMedicamentoForm);
	  	    
};


function guardarMedicamento(){
	if(validNonEmptyFieldsMedicamento()&& validateInputsForm(document.altaMedicamentoForm)){
		document.altaMedicamentoForm.submit();
	}
}



function validNonEmptyFieldsMedicamento(){
	
	if(document.getElementById('medicamentoNombre').value==="" ){
		alert("Favor de capturar un nombre");
		document.getElementById('medicamentoNombre').focus();
		return false;
	}else if(document.getElementById('laboratorio').value===""){
		alert("Favor de capturar un laboratorio");
		document.getElementById('laboratorio').focus();
		return false;
	}else if(document.getElementById('precio').value===""){
		alert("Favor de capturar un precio");
		document.getElementById('precio').focus();
		return false;
	}
	return true;
}