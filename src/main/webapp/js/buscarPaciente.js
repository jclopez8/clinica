/**
 * 
 */
	function buscarPaciente(){
		var input = document.getElementById('pacienteNom');
			if(validateFilter(input.value)){
				document.buscarPacienteForm.submit();
			}else{
				alert("Debe teclear por lo menos 3 caracteres...");
			}
		}
	
	function altaReporteMedico(pacienteId){
		var url = '/clinicaweb/alta/reporte_medico?pacienteId='+pacienteId;
		window.location.href=url;
	}
	function altaPaciente(pacienteId){
		//alert('alta Paciente...'+pacienteId);
		//document.buscarPacienteForm.method='get';
		var url = '/clinicaweb/alta/cita?pacienteId='+pacienteId;
		//alert(url);
		window.location.href=url;

		//document.buscarPacienteForm.action=url;
		//document.buscarPacienteForm.submit();
	}
	
	
	function showNotesWindow(url){
		newwindow=window.open(url,'name','height=300,width=600');
		if (window.focus) {newwindow.focus();}

		return false;
	}