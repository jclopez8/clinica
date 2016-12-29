/**
 * 
 */

function calcularTotal(){
	//alert('recalculandoTotal....');
	var totalesTratamiento = document.getElementsByName('tratamientoTotal');
	var totalesConsulta = document.getElementsByName('consultaTotal');
	var totalesMedicamento = document.getElementsByName('medicamentoTotal');
	var total = 0;

	  for (var i=0; i<totalesTratamiento.length; i++) {
		  
		  total = total+parseFloat( totalesTratamiento[i].value);
		     
	  }	  
	 // alert('tatal after Med: '+total);
	  
	  for (var i=0; i<totalesConsulta.length; i++) {
		
		  total = total+parseFloat(totalesConsulta[i].value);
		     
	  }	
	 // alert('totale after consulta: '+total);
	  for (var i=0; i<totalesMedicamento.length; i++) {
		 
		  //alert('Medicamento Total: '+total+totalesMedicamento[i].value);
		  total = total+parseFloat(totalesMedicamento[i].value);
		     
	  }	
	  //alert('Total: '+total);
	  document.getElementById('totalAll').value=total;
	  calcularTotalTarjeta();
}


function calcularTotalTarjeta(){
	//alert('recalculandoTotal Targeta....');
	var totalesTratamiento = document.getElementsByName('tratamientoTarjeta');
	var totalesConsulta = document.getElementsByName('consultaTarjeta');
	var totalesMedicamento = document.getElementsByName('medicamentoTarjeta');
	var total = 0;

	  for (var i=0; i<totalesTratamiento.length; i++) {
		  
		  total = total+parseFloat( totalesTratamiento[i].value);
		     
	  }	  
	 // alert('tatal after Med: '+total);
	  
	  for (var i=0; i<totalesConsulta.length; i++) {
		
		  total = total+parseFloat(totalesConsulta[i].value);
		     
	  }	
	 // alert('totale after consulta: '+total);
	  for (var i=0; i<totalesMedicamento.length; i++) {
		 
		  //alert('Medicamento Total: '+total+totalesMedicamento[i].value);
		  total = total+parseFloat(totalesMedicamento[i].value);
		     
	  }	
	  //alert('Total: '+total);
	  document.getElementById('totalTarjeta').value=total;
	  calcularTotalEfectivo();
}


function calcularTotalEfectivo(){
	//alert("calcular total efectivoooooo oo oo o o o");
	document.getElementById('totalEfectivo').value = parseFloat(document.getElementById('totalAll').value) - parseFloat(document.getElementById('totalTarjeta').value);
}

/*
function generarTratamientoRows(){
	var tratamientoList = document.getElementsByName('rowTratamiento'); 
	var tratamientoEfectivoAux='';
	var tratamientoTarjetaAux = '';
	var tratamientoTotalAux = '';
	var tratamientoValeAux = '';
	var tratamientoDescuentoAux='';
	
	for(var index=0; index<tratamientoList.length; index++){
		tratamientoEfectivoAux = document.getElementById('efectivoTratamiento'+tratamientoList[index].id);
		
		 tratamientoTarjetaAux =  document.getElementById('tarjetaTratamiento'+tratamientoList[index].id);
		 tratamientoTotalAux =  document.getElementById('totalTratamiento'+tratamientoList[index].id);
		 tratamientoValeAux =  document.getElementById('valeComboTratamiento'+tratamientoList[index].id);
		 tratamientoDescuentoAux= document.getElementById('descuentoDrComboTratamiento'+tratamientoList[index].id);
		 tratamientoList[index].value = tratamientoList[index].value + tratamientoEfectivoAux.value +';'+tratamientoTarjetaAux.value+';'+tratamientoTotalAux.value+';'+tratamientoValeAux.value+';'+extraerDescuentoPercent(tratamientoDescuentoAux.value)+';';
		 alert('Row- '+tratamientoList[index].value);
	}
	
}*/


function generarRows(concepto){
	var tratamientoList = document.getElementsByName('row'+concepto); 
	var cantidadAux = '';
	var tratamientoEfectivoAux='';
	var tratamientoTarjetaAux = '';
	var tratamientoTotalAux = '';
	var tratamientoValeAux = '';
	var tratamientoDescuentoAux='';
	
	for(var index=0; index<tratamientoList.length; index++){
		
		tratamientoEfectivoAux = document.getElementById('efectivo'+concepto+tratamientoList[index].id);
		
		 tratamientoTarjetaAux =  document.getElementById('tarjeta'+concepto+tratamientoList[index].id);
		 tratamientoTotalAux =  document.getElementById('total'+concepto+tratamientoList[index].id);
		 tratamientoValeAux =  document.getElementById('valeCombo'+concepto+tratamientoList[index].id);
		 tratamientoDescuentoAux= document.getElementById('descuentoDrCombo'+concepto+tratamientoList[index].id);
		
		 if (concepto=='Medicamento'){//para el row de MEDICAMENTOS
			 //alert("Med Id"+tratamientoList[index].id);
			 cantidadAux = document.getElementById('cantidad'+concepto+tratamientoList[index].id);	
			 //alert("cantidad aux"+cantidadAux.value);
			 tratamientoList[index].value = tratamientoList[index].value + tratamientoEfectivoAux.value +';'+tratamientoTarjetaAux.value+';'+tratamientoTotalAux.value+';'+tratamientoDescuentoAux.value+';'+cantidadAux.value+";";
		 }else if(concepto=='Consulta'){//para el row de CONSULTAS
			 tratamientoList[index].value = tratamientoList[index].value + 
			 tratamientoEfectivoAux.value +';'+tratamientoTarjetaAux.value+';'+
			 tratamientoTotalAux.value+';'+tratamientoDescuentoAux.value+';';
		 }else{//para el row de TRATAMIENTOS
		      tratamientoList[index].value = tratamientoList[index].value + tratamientoEfectivoAux.value +';'+tratamientoTarjetaAux.value+';'+tratamientoTotalAux.value+';'+tratamientoValeAux.value+';'+tratamientoDescuentoAux.value+';';
		}
		 //alert('Row- '+tratamientoList[index].value);
	}
	
}

function extraerDescuentoPercent(value){
	var descento= 1 - parseFloat(value);
	descento = descento * 100;
	return descento;
}

function agregarDescuento(id, combo, concepto){
	//alert('descuentoooId'+id);
	var efectivo =  document.getElementById('efectivo'+concepto+id);
	var tarjeta = document.getElementById('tarjeta'+concepto+id);
	var totalRow =  document.getElementById('total'+concepto+id);
	var totalHidden =  document.getElementById('total'+concepto+"Hidden"+id);
	var valeCombo = document.getElementById('valeCombo'+concepto+id);
	var precioTrat = document.getElementById('precio'+concepto+id);
	/*var valeToRest=0
	if (valeCombo!=null){
	
		alert(valeCombo.value);
		valeToRest=valeCombo.value;
	}*/
	//alert
	if (concepto == 'Medicamento'){
		var cantidad = document.getElementById('cantidad'+concepto+id);
	
		
		 totalRow.value = (totalHidden.value)*combo.value*cantidad.value;
			//efectivo.value = (precioTrat.value)*combo.value*cantidad.value;
		 if (totalRow.value - tarjeta.value>0){
			efectivo.value =  totalRow.value - tarjeta.value;
		 }else{
			 alert('cantidad de tarjeta invalida');
			 tarjeta.value=0;
			 efectivo.value =  totalRow.value;
		 }
		// tarjeta.value = totalRow.value - efectivo.value;
		
	}else{
	efectivo.value = (precioTrat.value)*combo.value;
	
	 totalRow.value = (totalHidden.value)*combo.value;
	 tarjeta.value = totalRow.value - efectivo.value;
	}
		 //parseFloat(efectivo.value)+ parseFloat(tarjeta.value); //document.getElementById('total'+concepto+id); se hace la suma para el caso de que se ajuste el descuento hacia abajo
	//alert('totalRowwwww'+totalRow.value);
	 //efectivo.value = (efectivo.value)*combo.value;
	 //tarjeta.value = (tarjeta.value)*combo.value;
	//totalRow.value = (totalRow.value)*combo.value;
	calcularTotal();
	
	
}



function ajustarPagoTratamientoVale(id, combo){
	
	var efectivo =  document.getElementById('efectivoTratamiento'+id);//solo los tratamientos tienen vale
	var tarjeta = document.getElementById('tarjetaTratamiento'+id);
	var totalRow =  document.getElementById('totalTratamiento'+id);
	var descuento = document.getElementById('descuentoDrComboTratamiento'+id);
	 totalRow.value = (parseFloat(efectivo.value)+ parseFloat(tarjeta.value));

		if (totalRow.value>combo.value){
		   totalRow.value = (totalRow.value-combo.value)*parseFloat(descuento.value);
		   calcularTotal();
		}else{
			alert("el vale no puede ser mayor al precio del Tratamiento");
			combo.selectedIndex =0;
		}
	
}

function agregarConsulta(url){
	//alert("agregar consulta..");
	newwindow=window.open(url,'consultas','height=200,width=500');
	if (window.focus) {newwindow.focus();}

	return false;
}

function cobrar(){
	//alert("cobrar");
	generarRows('Tratamiento');
	generarRows('Medicamento');
	generarRows('Consulta');
	document.cajaForm.action="/sanantial/caja/cobrar";
	document.cajaForm.submit();
}


function guardarConsultas(){
	//alert("guardarrrr consulta..");
	var idOpenerVar = "idConsulta";
	var idVar = 'consulta';
	var hiddenConsultaId = 'hiddenConsultaId';
	var hiddenConsultaNombre = 'hiddenConsultaNombre';
	guardarIds(idOpenerVar, idVar, hiddenConsultaId, hiddenConsultaNombre);
}

function guardarIds(idOpenerVar, idVar, hiddenId, hiddenNombre){
	var opener = window.opener.document;
	formOpener = opener.getElementById("cajaForm");
	var idsOpener = opener.getElementById(idOpenerVar);
	var hiddenIdOpener = opener.getElementsByName(hiddenId);
	var hiddenNombreOpener = opener.getElementsByName(hiddenNombre);
	
	var ids = document.getElementsByName(idVar); 
	//alert("Ids Opener value before:"+idsOpener.value);
//	idsOpener.value="";
	for(var index=0; index<ids.length; index++){
		if(ids[index].checked) {
			for(var indexOpener=0; indexOpener<hiddenIdOpener.length; indexOpener++){
				if(ids[index].value==hiddenIdOpener[indexOpener].value){
					alert("El elemento " + hiddenNombreOpener[indexOpener].value + " ya existe!");
					return;
				}
			}
			if(ids[index].value==""){
				alert("..vacio..");
			}
			idsOpener.value = idsOpener.value + ids[index].value + ":";
			//alert("Ids Opener value after:"+idsOpener.value);
		}
	}
//	alert(idsOpener.value);
	self.close();
	formOpener.submit();
}

function ajustarPagoTarjeta(id,concepto){
	//alert("ajustarPagoTarjeta::: "+id+" : "+concepto);
	var cantidad=  document.getElementById("cantidad"+concepto+id);
	var efectivo = document.getElementById("efectivo"+concepto+id);
	var tarjeta = document.getElementById("tarjeta"+concepto+id);
	var precio = document.getElementById("precio"+concepto+id);//el precio es el que nunca se mueve
	var descuento = document.getElementById("descuentoDrCombo"+concepto+id);
	//alert("precio value"+precio.value+"descuentoDrCombo "+descuento.value);
	if ((tarjeta.value>(precio.value*cantidad.value*descuento.value))||(tarjeta.value<0)){
		alert("cantidad en tarjeta invalida...");
		tarjeta.value=0;
	}else{
		efectivo.value=(precio.value*cantidad.value*descuento.value)-tarjeta.value;
	}
	calcularTotalTarjeta();
	
}

function ajustarPagoTarjeta2(tarjeta){
	//alert("blur: "+tarjeta.value);
}

function ajustarCantidad(id,concepto){
	//alert("id :: "+id+" concepto: "+concepto);
	var cantidad=  document.getElementById("cantidad"+concepto+id);
	var precio = document.getElementById("precio"+concepto+id);
	//alert("precio value"+precio.value);
	var totalElem=document.getElementById("total"+concepto+id);
	//alert("total valuee ee"+totalElem.value);
	var tarjetaElem = document.getElementById("tarjeta"+concepto+id);
	var descuento = document.getElementById('descuentoDrCombo'+concepto+id);
	//alert("tarjeta"+tarjeta.value);
	totalElem.value= cantidad.value*parseFloat(precio.value)*parseFloat(descuento.value);
	//alert("nuevo total:"+total.value);
	var efectivo = document.getElementById("efectivo"+concepto+id);
	//alert("efectivo: "+efectivo.value+" nuevo totalll:"+totalElem.value+" tarjeta"+tarjetaElem.value+" iff "+(totalElem.value>tarjetaElem.value));
	//if(totalElem.value>tarjetaElem.value){
	   efectivo.value=totalElem.value-tarjetaElem.value;
//	}else{
//		alert("cantidad en tarjeta invalidaaaa...");
//		tarjetaElem.value=0;
//		efectivo.value=total.value-tarjetaElem.value;
//	}
	  
	   calcularTotal();
	  
}
	

function ajustarPagoTarjetaEnter(e,id,concepto) {
  if (e.keyCode == 13) {
    	ajustarPagoTarjeta(id,concepto);
     }
}
	

function quitarElemento(){
	
    var citasId = document.getElementById("citasId").value;
   // alert('quitar elemento... '+citasId);
	var checkboxes = document.getElementsByName('checkToDelete');
	var elementosDeleted="";//[] ;

	  for (var i=0; i<checkboxes.length; i++) {
		     // And stick the checked ones onto an array...
		     if (checkboxes[i].checked) {
		    	//alert(checkboxes[i].id);
		    	//elementosDeleted.push(checkboxes[i].value);
		    	elementosDeleted = elementosDeleted+checkboxes[i].id+";";
		     }
		  }
		var checkboxesTrat = document.getElementsByName('checkToDeleteTratamiento');
		var tratamientosDeleted = "";//[];
		//alert('elementos Deleted... '+elementosDeleted);
		for (var i=0; i<checkboxesTrat.length; i++) {
		     // And stick the checked ones onto an array...
		     if (checkboxesTrat[i].checked) {
		    	//alert(checkboxesTrat[i].id);
		    	//tratamientosDeleted.push(checkboxesTrat[i].value);
		    	tratamientosDeleted = tratamientosDeleted+checkboxesTrat[i].id+";";
		     }
		  }
		
		
		$.ajax({  
		     type : "Get",   
		     url : "/sanantial/caja/eliminar",   
		     data : ({elementosDeleted : elementosDeleted, tratamientosDeleted:tratamientosDeleted, citasId:citasId } ),  
		     
		     success : function(response) {  
		     // alert(response); 
			      for (var i=0; i<checkboxes.length; i++) {
					     // And stick the checked ones onto an array...
					     if (checkboxes[i].checked) {
					    	// alert("deleting venta"+checkboxes[i].id);
					       	$('#venta'+checkboxes[i].id).remove();
					       	
					     }
					  }
			      for (var i=0; i<checkboxesTrat.length; i++) {
					     // And stick the checked ones onto an array...
					     if (checkboxesTrat[i].checked) {
					    	//alert("deleting trat"+checkboxesTrat[i].id);
					    	//tratamientosDeleted.push(checkboxesTrat[i].value);
					    	$('#trat'+checkboxesTrat[i].id).remove();
					     }
					  }
			      calcularTotal();
		      
		     },  
		     error : function(e) {  
		      alert('Error: ' + e);   
		     }  
		    });  
	  
}
