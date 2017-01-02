/**
 * 
 */

function showChangeStatusWindow(url){
	newwindow=window.open(url,'name','height=200,width=500');
	if (window.focus) {newwindow.focus();}

	return false;
}



function showNotesEnfermeraWindow(url){
	newwindow=window.open(url,'name','height=300,width=600');
	if (window.focus) {newwindow.focus();}

	return false;
}

function salvarNota(){
	var docOpener = window.opener.document;
	//alert(doc);
	theForm = docOpener.getElementById("tableroEnfermerasForm");
	var observationsToSave = docOpener.getElementById("observationsToSave");
	observationsToSave.value = document.getElementById("observationsPopup").value;
	
	docOpener.getElementById("citaToChange").value=document.getElementById("citaToChangePopup").value;
	
	self.close();
	theForm.action="/clinicaweb/salvar/nota";
	theForm.submit();

}

function cambiarEstatus(){
		//alert("cambiar statuswww");

		
		var docOpener = window.opener.document;
		//alert(doc);
		//theForm = docOpener.getElementById("tableroEnfermerasForm");
		theForm = docOpener.forms[0];
		//alert(theForm);
		var statusToChange = docOpener.getElementById("statusToChange");
		//alert("cita to change Pop: "+document.getElementById("citaToChangePopup").value);
		docOpener.getElementById("citaToChange").value=document.getElementById("citaToChangePopup").value;
		//alert("cita to change "+docOpener.getElementById("citaToChange").value);
		var radios =  document.getElementsByName("status");
		//alert('radios.length '+radios.length);
		for (var i=0; i<radios.length; i++) {
			if (radios[i].checked) {
				//alert(statusToChange.value);
				statusToChange.value =radios[i].value;
			}
		}
		//alert(statusToChange.value);

		self.close();
		theForm.submit();

}

function quitarTratamiento(citaId,tratamientoId){
	//alert("deleting trata from: "+citaId+" TratId: "+tratamientoId);
	document.getElementById("citaToChange").value=citaId;
	document.getElementById("tratamientoDeleted").value=tratamientoId;
	document.tableroEnfermerasForm.method="POST";
	document.tableroEnfermerasForm.action="/clinicaweb/quitar/tratamiento";
	document.tableroEnfermerasForm.submit();
}

function salvarEnfermera(citaId){
	//alert("salvar enfermera..."+citaId);
	//alert("enfermeraId"+document.getElementById("enfermerasCombo"+citaId).value);
	document.getElementById("citaToChange").value=citaId;
	document.tableroEnfermerasForm.enfermeraToAdd.value=document.getElementById("enfermerasCombo"+citaId).value;
	document.tableroEnfermerasForm.method="POST";
	document.tableroEnfermerasForm.action="/clinicaweb/salvar/enfermera";
	document.tableroEnfermerasForm.submit();
}