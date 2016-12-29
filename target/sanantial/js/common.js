/**
 * common functions for all .JS declared in header.jsp
 */


/**
 * Uncheck all check boxes of some table searched by table name
 */
  function uncheckAllCheckBoxes(tableName){
	  var checkboxes = document.getElementsByName(tableName);
	 // alert("tabla para deschekarrrr:"+checkboxes.length);
	  for (var i=0; i<checkboxes.length; i++) {
		     // And stick the checked ones onto an array...
		     if (checkboxes[i].checked) {
		    	 checkboxes[i].checked=false;
		        
		     }
		  }
  }
  
  function validateInput(text, input) {
	  //alert("validateInput...."+input);
	    var regularExpression;
	    var valid = false;
		if(input == "number") {
			regularExpression = new RegExp("^([0-9]+)$");
		} else if(input == "text") {
			regularExpression = new RegExp("^([^<>]{1,3000})$");//new RegExp("^([^0-9]*)$");
		} else if(input == "FreeText") {
			//alert("Freee....");
			regularExpression = new RegExp("^([^<>]{1,3000})$");
		} else if(input == "Float") {
			regularExpression = new RegExp("(-)?[0-9]+(.[0-9]+)?");
		} else if(input == "money"){
			regularExpression = new RegExp("^([0-9]+)(\\.[0-9]{2})?$");
		} else if(input == "date"){
			return true;
		} else if(input == "tel"){
			alert("case TEl");
			regularExpression = new RegExp("\\d{3}-\\d{3}-\\d{4}|\\d{10}");
		}
		
	    if(regularExpression.test(text)) {
	    	//alert("valid expresion!!");
	        valid = true;
	    }
	    return valid;
	}
  
 
  
  function resetForm(form) {
	    // clearing inputs
	    var inputs = form.getElementsByTagName('input');
	    for (var i = 0; i<inputs.length; i++) {
	        switch (inputs[i].type) {
	            // case 'hidden':
	            case 'text':
	                inputs[i].value = '';
	                break;
	            case 'number':
	                inputs[i].value = '';
	                break;
	            case 'tel':
	                inputs[i].value = '';
	                break;
	            case 'radio':
	            case 'checkbox':
	                inputs[i].checked = false;   
	        }
	    }

	    // clearing selects
	    var selects = form.getElementsByTagName('select');
	    for (var i = 0; i<selects.length; i++)
	        selects[i].selectedIndex = 0;

	    // clearing textarea
	    var text= form.getElementsByTagName('textarea');
	    for (var i = 0; i<text.length; i++)
	        text[i].innerHTML= '';

	    return false;
	}
  
  function validateInputsForm(form){
	  //alert('validating form....');
	  var inputs = form.getElementsByTagName('input');
	    for (var i = 0; i<inputs.length; i++) {
	    	  if(inputs[i].value!=""){
	              	if(!(validateInput(inputs[i].value,inputs[i].type ))){
	            		alert('Campo invalido: '+inputs[i].id);
	            		inputs[i].focus();
	            		return false;
	            	}
	    	  }
	    }
	    return true;
  }
  
  
  function trim(text) {
	   return text.replace(/^\s*|\s*$/g,"");
	}
  
  function validateFilter(text){
	  var regularExpression;
	  regularExpression = new RegExp("\[a-zA-Z]{3}");
	  var valid = false;
	  if(regularExpression.test(text)) {
	    	//alert("valid expresion!!");
	        valid = true;
	    }
	  return valid;
  }
  
 