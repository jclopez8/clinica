/**
 * JS for all functionalities related with agregarTratamiento.jsp
 * format of input-> Id;TratamientoNombre;Precio:
 * 
 */
	function buscarTratamiento(){
		var input = document.getElementById('tratamientoNombre');
		if(validateFilter(input.value)){
			document.agregarTratamientoForm.submit();
		}else{
			alert("Debe teclear por lo menos 3 caracteres...");
		}
			
	}
	
	
	function agregarTratamiento(){
		  var checkboxes = document.getElementsByName('buscados');
    	  var checkboxesChecked = [];
		  for (var i=0; i<checkboxes.length; i++) {
			     // And stick the checked ones onto an array...
			     if (checkboxes[i].checked) {
			    	if(isDuplicate(checkboxes[i].value)){
			           checkboxesChecked.push(checkboxes[i].value);
			    	}
			     }
			  }
		  desplegarTablaVerificadosHist(checkboxesChecked);
		  uncheckAllCheckBoxes('buscados');
    	}
	
	function isDuplicate(value){
		var verificadosHistory = document.agregarTratamientoForm.verificadosHist.value;
		if(verificadosHistory.length>0){ 
			var verificadosHistoryHash = verificadosHistory.split(":");
			  for (var i=0; i<verificadosHistoryHash.length; i++) {
				  if(verificadosHistoryHash[i]!=""){
					  if(extractId(verificadosHistoryHash[i])==extractId(value)){
						  alert(extractTratamientoName(value)+" Ya fue agregado a la lista");
						  return false;
					  }
				  }
			  }
		}
		return true;
	}
	
	
	
	function Terminar(){
		//alert('Terminar...');
		document.agregarTratamientoForm.action='/clinicaweb/guardar/tratamiento';
		document.agregarTratamientoForm.submit();
	}
	
	function Cancelar(){
		//alert('Terminar...');
		document.agregarTratamientoForm.action='/clinicaweb/cancelar/tratamiento';
		document.agregarTratamientoForm.submit();
	}
	
	/**
	 * Substract Name from value ID;NAME;PRICE
	 */
	
	function extactName(value){
		//alert("value complete "+value);
	
	
		value = value.substring(value.indexOf(";")+1, value.indexOf(";",value.indexOf(";")+1));//extrae el nombre de la cadena

		return value;
	}
	
	
	/**
	 * Substract PRICE from value ID;NAME;PRICE
	 */
	
	function extactPrice(value){
		//alert("value PRI complete "+value);
	
	
		var retvalue = value.substring(value.indexOf(";",value.indexOf(";")+1)+1,value.lenght);//extrae el precio
		//alert("retValue "+retvalue);
		return retvalue;
	}
	
	
/**
 * Check elements loaded before and display them in text area
 */	
  function agregarVerificadosHist(){
	      // alert("onload history value-"+document.agregarTratamientoForm.verificadosHist.value);
	       var verificadosHist = document.agregarTratamientoForm.verificadosHist.value;
	       document.agregarTratamientoForm.verificadosHist.value="";
	       //alert("verificados hist lenght-"+verificadosHist.length);
	       if(verificadosHist.length>0){ 
	         var verificadosHistHash = verificadosHist.split(":");
	         desplegarTablaVerificadosHist(verificadosHistHash);
	       }
  }
  
  
	/**
	 * Display table and set its values from 'onload' event or from 'agregar' button
	 */
  function desplegarTablaVerificadosHist(verificadosHistHash){
	  //alert("desplegarTablaVerificadosHist--");
	  var table = document.getElementById("agregados");
	  
	  for (var i=0; i<verificadosHistHash.length; i++) {
   	     //alert("hash: "+verificadosHistHash[i]);
   	     if(verificadosHistHash[i]!=""){
 		    var row = table.insertRow(i);
 		
		    // Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
	    	var cell1 = row.insertCell(0);
		    var cell2 = row.insertCell(1);
		    var cell3 = row.insertCell(2);

		   // Add some text to the new cells:
		   //cell1.innerHTML = "<input type='checkbox'/>'";
		    var element1 = document.createElement("input");
		    element1.id = extractId(verificadosHistHash[i]);
            element1.type = "checkbox";
            element1.name="verificados";
            //alert('VAlueee-'+verificadosHistHash[i]);
            element1.value=verificadosHistHash[i];
            cell1.appendChild(element1);
		
            cell2.innerHTML = extactName(verificadosHistHash[i]);
		     cell3.innerHTML = extactPrice(verificadosHistHash[i]);
		 
		    verificadosHist.value =  verificadosHist.value + verificadosHistHash[i]+":";
		   // alert("verificados after onload-"+verificadosHist.value);
   	     }  
      }
	  
  }
  
  function quitarTratamiento(){
	  var verificados = document.getElementsByName('verificados');
	//  alert("verificados size: "+verificados.length);
	  for (var i=0; i<verificados.length; i++) {
		  if (verificados[i].checked) {
			 // alert("cheked i-"+i);
			  quitarVerificadosHist(verificados[i].value);
			  document.getElementById("agregados").deleteRow(i);
		  }
	  
	  }
  }
  
  function quitarVerificadosHist(value){
	  //alert("hash to delete..."+value);
	  var verificadosHist = document.agregarTratamientoForm.verificadosHist.value;
	  document.agregarTratamientoForm.verificadosHist.value="";
      if(verificadosHist.length>0){ 
           var verificadosHistHash = verificadosHist.split(":");
           for (var i=0; i<verificadosHistHash.length; i++) {
        	 //  alert("hasha to adding- "+verificadosHistHash[i]);
         	      if(verificadosHistHash[i]!="" && verificadosHistHash[i]!=value){//va meter todos menos el buscado
         	    	 document.agregarTratamientoForm.verificadosHist.value =   document.agregarTratamientoForm.verificadosHist.value + verificadosHistHash[i]+":";
         	       }
         	}
        }
	//  alert("despues de eliminar- "+ document.agregarTratamientoForm.verificadosHist.value);
  }

  
  function extractId(value){
	  var id = value.substring(0,value.indexOf(";"));
	  return id;
  }
  
  function extractTratamientoName(value){
	  return value.substring(value.indexOf(";")+1,value.lastIndexOf(";"));
  }
	  
	  window.onload = function () { 

		  agregarVerificadosHist();	    
	};
	  
	
	  
	  