function guardarReporteMedico(){
	 document.reporteMedicoForm.submit();
}

$(document).ready(function() {
    $("#repMedA").keyup(function (e) {
    	 if(($(this).val().split(".")[0]).indexOf("00")>-1){
    		 $(this).val($(this).val().replace("00","0"));
    	 } else {
    		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
    	 }
    	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
    		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
    	 } 
    	 
    });
    $("#repMedB").keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
    $('input[id="reporteMedico.resp"]').keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
    $('input[id="reporteMedico.pulso"]').keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
    $('input[id="reporteMedico.tem"]').keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
    $('input[id="reporteMedico.sao2"]').keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
    $('input[id="reporteMedico.peso"]').keyup(function (e) {
    	if(($(this).val().split(".")[0]).indexOf("00")>-1){
	   		 $(this).val($(this).val().replace("00","0"));
	   	 } else {
	   		 $(this).val($(this).val().replace(/[^0-9\.]/g,''));
	   	 }
	   	 if($(this).val().split(".")[2] != null || ($(this).val().split(".")[2]).length ){
	   		 $(this).val($(this).val().substring(0, $(this).val().lastIndexOf(".")));
	   	 }
    });
});