<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/altaPaciente.js" />">
</script>



	<div id="main">
	  <div id="center">
			<h2>Alta Paciente</h2>
		
		  <form:form modelAttribute="paciente" action="/clinicaweb/salvar/paciente" method="post" name="altaPacienteForm" id="altaPacienteForm" >
			<table class="input_table_items"> 
			    <tr>
				      <td>
					    <form:label path="pacienteNombre" >Nombre:</form:label>
					  </td>
					  <td>  
					    <form:input path="pacienteNombre" id="pacienteNombre"/>
					  </td>
					  <td>
					    <form:label path="pacienteApellidoPat">Apellido Paterno:</form:label>
					  </td>
					  <td> 
					    <form:input path="pacienteApellidoPat"   id="apellidoPaterno"/>
					  </td>
					  <td>
					    <form:label path="pacienteApellidoMat">Apellido Materno:</form:label>
					  </td>
					  <td>   
					    <form:input path="pacienteApellidoMat"/>
					  </td> 
				</tr>
			    <tr>
			      <td>
		    		 <form:label path="sexo">Sexo:</form:label>
		    		   </td>
				  <td>
		    		 <form:select path="sexo" name="select" >
				               <option value="Masculio">M</option>
				               <option value="Femenino">F</option>
				     </form:select>
				  </td>
				  <td>   
				     <form:label path="curp">CURP:</form:label>
				     </td>
				  <td>  
				     <form:input path="curp"   />
				  </td>
				  <td>
				     <form:label path="fechaNac">Fecha de Nacimiento:</form:label>
				       </td>
				  <td>
				  
				  
			
				<input type="date"  name="d" value="1970-01-01"  size="10" />
				
				
			  
				  
				    
				  </td>
				 </tr>
				 <tr>
				   <td>
				     <form:label path="ocupacion">Ocupacion:</form:label>
				       </td>
				  <td>
				     <form:select path="ocupacion" name="select" >
				               <option VALUE="profesionista">Profesionista</option>
				               <option VALUE="comerciante">Comerciante</option>
				               <option VALUE="empleado">Empleado</option>
				               <option VALUE="Ingeniero">Ingeniero</option>
				               <option VALUE="Doctor">Doctor</option>
				               <option VALUE="Trabajadaor Salud">Trabajador de la Salud</option>
				               <option VALUE="Servidor publico">Servidor publico</option>
				               <option VALUE="Artista-Artesano">Artista/Artesano</option>
				               <option VALUE="Empresario">Empresario</option>
				               <option VALUE="Ama de casa">Ama de casa</option>
				               <option VALUE="Estudiante">Estudiante</option>
				               <option VALUE="Sin Ocupacion">Sin Ocupacion</option>
					     </form:select>
				   </td>
				   <td>
				     <form:label path="calle">Calle:</form:label>
				       </td>
				  <td>
				     <form:input  path="calle"   />
				   </td>
				   <td>
				     <form:label path="numero">Numero:</form:label>
				       </td>
				  <td>
				     <form:input  path="numero" type="number"  />
				   </td> 
				 </tr>
				 <tr>
					  <td>
					     <form:label path="colonia">Colonia:</form:label>
					 </td>
					  <td>
					     <form:input  path="colonia"   />
					  </td>
					  <td>
					     <form:label path="ciudad">Ciudad:</form:label>
					  </td>
					  <td>
					     <form:input path="ciudad"   />
					  </td>
					  <td>
					     <form:label path="estado">Estado:</form:label>
					 </td>
					  <td>
					     <form:select path="estado" name="select">
				                <option VALUE="Aguascalientes">Aguascalientes</option>
				                <option VALUE="Baja California Norte">Baja California Norte</option>
				                <option VALUE="Baja California Sur">Baja California Sur</option>
				                <option value="Campeche">Campeche</option>
							    <option value="Chiapas">Chiapas</option>
								<option value="Chihuahua">Chihuahua</option>
								<option value="Coahuila">Coahuila</option>
								<option value="Colima">Colima</option>
								<option value="Distrito Federal">Distrito Federal</option>
								<option value="Durango">Durango</option>
								<option value="Estado de México">Estado de México</option>
								<option value="Guanajuato">Guanajuato</option>
								<option value="Guerrero">Guerrero</option>
								<option value="Hidalgo">Hidalgo</option>
								<option value="Jalisco">Jalisco</option>
								<option value="Michoacán">Michoacán</option>
								<option value="Morelos">Morelos</option>
								<option value="Nayarit">Nayarit</option>
								<option value="Nuevo León">Nuevo León</option>
								<option value="Oaxaca">Oaxaca</option>
								<option value="Puebla">Puebla</option>
								<option value="Querétaro">Querétaro</option>
								<option value="Quintana Roo">Quintana Roo</option>
								<option value="San Luis Potosí">San Luis Potosí</option>
								<option value="Sinaloa">Sinaloa</option>
								<option value="Sonora">Sonora</option>
								<option value="Tabasco">Tabasco</option>
								<option value="Tamaulipas">Tamaulipas</option>
								<option value="Tlaxcala">Tlaxcala</option>
								<option value="Veracruz">Veracruz</option>
								<option value="Yucatán">Yucatán</option>
								<option value="Zacatecas">Zacatecas</option>
								<option value="Extrangero">Extrangero</option>
					     </form:select>
					  </td>
				 </tr>
				 
				 <tr>
					  <td>
					     <form:label path="telefonoCasa">Telefono Casa:</form:label>
					 </td>
					  <td>
					     <form:input  path="telefonoCasa" type="tel" />
					  </td>
					  <td>
					     <form:label path="celular">Celular:</form:label>
					  </td>
					  <td>
					     <form:input path="celular" type="tel" />
					  </td>
					  <td>
					     
					 </td>
					  <td>
					     
					  </td>
				 </tr>
				 
				 <tr>
				  <td> 
				  
				   <button type="button" value="Guardar Paciente" onclick="javascript:guardarPaciente()">Guardar Paciente</button>
				  </td>
				  <td>
				  </td>
				  <td>
				  </td>
				  </tr>  
				  <tr>
				    <td>
				        <c:if test="${saved == 'success'}">
			            	<p class="success">Paciente Guardado</p>
			            </c:if>
						<c:if test="${deleted == 'success'}">
							<p class="success">Paciente Borrado</p>
						</c:if>
						<c:if test="${status == 'exist'}">
							<p class="error">el Paciente ya existie</p>
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
