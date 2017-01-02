/**
 * 
 */

function showCatalogo(url){
	newwindow=window.open(url,'name','height=200,width=500');
	if (window.focus) {newwindow.focus()}

	return false;
}

function guardarGastos(){
	var idOpenerVar = "idGastos";
	var idVar = 'gasto';
	var hiddenGastoId = 'hiddenGastoId';
	var hiddenGastoNombre ='hiddenGastoNombre';
	guardarIds(idOpenerVar, idVar, hiddenGastoId, hiddenGastoNombre);
}

function guardarIngresos(){
	var idOpenerVar = "idIngresos";
	var idVar = 'ingreso';
	var hiddenIngresoId = 'hiddenIngresoId';
	var hiddenIngresoNombre = 'hiddenIngresoNombre';
	guardarIds(idOpenerVar, idVar, hiddenIngresoId, hiddenIngresoNombre);
}

function guardarIds(idOpenerVar, idVar, hiddenId, hiddenNombre){
	var opener = window.opener.document;
	formOpener = opener.getElementById("reporteVentasForm");
	var idsOpener = opener.getElementById(idOpenerVar);
	var hiddenIdOpener = opener.getElementsByName(hiddenId);
	var hiddenNombreOpener = opener.getElementsByName(hiddenNombre);
	
	var ids = document.getElementsByName(idVar); 
	
//	idsOpener.value="";
	for(var index=0; index<ids.length; index++){
		if(ids[index].checked) {
			for(var indexOpener=0; indexOpener<hiddenIdOpener.length; indexOpener++){
				if(ids[index].value==hiddenIdOpener[indexOpener].value){
					alert("El elemento " + hiddenNombreOpener[indexOpener].value + " ya existe!");
					return;
				}
			}
			idsOpener.value = idsOpener.value + ids[index].value + ":";
		}
	}
//	alert(idsOpener.value);
	self.close();
	formOpener.submit();
}

function quitarIngreso(ingresoId){
	//alert('quitar ingreso..'+ingresoId);
	document.reporteVentasForm.hiddenIngresoId.value=ingresoId;
	document.reporteVentasForm.method="POST";
	document.reporteVentasForm.action="/clinicaweb/quitar/ingreso";
	document.reporteVentasForm.submit();
}


function quitarGasto(gastoId){
	//alert('quitar gasto..'+gastoId);
	document.reporteVentasForm.hiddenGastoId.value=gastoId;
	document.reporteVentasForm.method="POST";
	document.reporteVentasForm.action="/clinicaweb/quitar/gasto";
	document.reporteVentasForm.submit();
}

