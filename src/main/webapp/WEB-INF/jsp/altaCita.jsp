<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/altaCita.js" />">
</script>

	<div id="main">
	  <div id="center">
			<h2>Alta Cita</h2>
			
		   <c:url var="saveUrl" value="/alta/cita?pacienteId=${citas.paciente.pacienteId}" />
		  <form:form modelAttribute="citas" action="${saveUrl}" method="post" name="altaCitaForm" >
			<table > 
				<tr>
				  <td>
				    
				     <form:label path="paciente.pacienteNombre">Nombre:</form:label>
				  </td>
				  <td>   
				     <form:input path="paciente.pacienteNombre"  readonly="readonly"/>
				  </td>
				  <td>
				    <form:label path="paciente.pacienteApellidoPat">Apellido Paterno:</form:label>
				   </td>
				  <td>    
				    <form:input path="paciente.pacienteApellidoPat"  readonly="readonly" />
				  </td>
				  <td>
				    <form:label path="paciente.pacienteApellidoMat">Apellido Materno:</form:label>
				 </td>
				  <td>  
				    <form:input path="paciente.pacienteApellidoMat"  readonly="readonly" />
				  </td> 
				 </tr> 
				 <tr>
				      <td>
			    		 <form:label path="paciente.sexo">Sexo:</form:label>
			    	</td>
				      <td>  
			    		 <form:input path="paciente.sexo"  readonly="readonly" />
					  </td>
					  <td>   
					     <form:label path="paciente.curp">CURP:</form:label>
					  </td>
				       <td>  
					     <form:input path="paciente.curp"  readonly="readonly" />
					  </td>
					  <td>
					     <form:label path="paciente.fechaNac">Fecha de Nacimiento:</form:label>
					  </td>
				       <td>  
					     <form:input path="paciente.fechaNac"  readonly="readonly" />
					  </td>
				 </tr>
				 <tr>
                  <td>
				    <form:label path="fecha">Fecha:</form:label>
				  </td>
				  <td>  
				    			
	                   <input type="date" name="d"  id="fecha"  size="10" />
				  </td>
				  <td>
<%-- 				    <form:label path="consulta">Consulta:</form:label> --%>
						<label>Hora:</label>
				  </td>
				  <td>  
<%-- 				    <form:input path="consulta" /> --%>
					     <select  name="hora">
				                <option VALUE="07:00">07:00</option>
				                <option VALUE="08:00">08:00</option>
				                <option VALUE="09:00">09:00</option>
				                <option value="10:00">10:00</option>
							    <option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
					     </select>
				  </td>
				  <td></td>
				  <td></td>

				</tr>
				
				 <tr>
				    <td> 
				    <button type="button" value="Guardar Cita" onclick="javascript:guardarCita()">Guardar Cita</button>
				    </td>
				    <td>
				        <c:url var="returnUrl" value="/buscar/paciente" />
				      <a href="${returnUrl}"><img src="<c:url value="/images/lupa.png" />" width="20px" height="20px"></img></a>
				    </td>
				    <td>
				    </td>
				  </tr>  
	
				  <tr>
				    <td>
				        <c:if test="${saved == 'success'}">
			            	<p class="success">Cita Guardada...</p>
			            	<script type="text/javascript">
			            	     resetForm(document.altaCitaForm);
			            	</script>
			            </c:if>
			            <c:if test="${saved == 'exist'}">
			            	<p class="success">Ya existe una cita previamente guardada para este paciente en la fecha especificada...</p>
			            </c:if>
			            
					
				    </td>
				    <td></td>
				    <td></td>  
				  </tr>
				  
			</table>	
		 </form:form>
		</div>
	</div>





<%@ include file="common/footer.jsp" %>
