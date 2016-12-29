<%@ include file="common/header.jsp" %>

	<div id="main">
	  <div id="center">
			<h2>Alta Cita</h2>
			
		<table > 
			    <tr>
                   <td>
				     <label>Nombre:</label>    
				    </td>
				    <td> 
				     <input type="text" disabled="disabled"/>
				   </td>
				   <td>
				     <label>Apellido Paterno:</label>    
				  </td>
				  <td> 
				     <input type="text" disabled="disabled"/>
				   </td>
                   <td>
                     <label>Apellido Materno:</label>    
                  </td>
				  <td> 
                     <input type="text" disabled="disabled"/>
                   </td>
				</tr>
				<tr>
                   <td>
				     <label>Sexo:</label> 
				  </td>
				  <td> 
				     <input type="text" disabled="disabled"/>
				   </td>
				   <td>
				     <label>Curp:</label>   
				   </td>
				  <td> 
				      <input type="text" disabled="disabled"/>
				   </td>
                   <td>
                     <label>Fecha de Nacimiento::</label> 
                  </td>
				  <td> 
                        <input type="text" disabled="disabled"/>
                   </td>
				</tr>
				<tr>
                  <td>
				   <label>Fecha:</label>  
				     </td>
				  <td> 
		    	     <input type="text" disabled="disabled"/>
				  </td>
				  <td>
				     <label>Hora:</label>  
				  </td>
				  <td> 
        		      <input type="text" disabled="disabled"/>
				  </td>
                  <td>
                  </td>
                  <td>
                  </td>
				</tr>
			    <tr>
				    <td> 
				        <c:url var="returnUrl" value="/buscar/paciente" />
				        <a href="${returnUrl}"><img src="<c:url value="/images/lupa.png" />" width="20px" height="20px"></img></a>
				    </td>
				    <td>
				    </td>
				    <td>
				    </td>
				  </tr> 
				  
				   
				  
		</table>	
		    <table>
		 		<tr>
						    <td>
						    
					            <c:if test="${saved == 'exist'}">
					            	<p class="success">Ya existe una cita previamente guardada para este paciente en la fecha especificada...</p>
					            </c:if>
					            <c:if test="${saved == 'invalidDate'}">
					            	<p class="success">No puede guardar una fecha anterior a hoy...</p>
					            </c:if>
							
						    </td>
						    
				  </tr>
			</table>
		</div>
	</div>





<%@ include file="common/footer.jsp" %>
