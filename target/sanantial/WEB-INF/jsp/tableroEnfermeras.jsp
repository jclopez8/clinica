<%@ include file="common/header.jsp" %>
<%@ include file="common/autoRefresh.jsp" %>



<script type="text/javascript" src="<c:url value="/js/buscarPaciente.js" />">
</script>
<script type="text/javascript" src="<c:url value="/js/tableroEnfermeras.js" />">
</script>



	<div id="main">
	  <div id="div_cent_expanded">
			<h2>Tablero enfermeras</h2>

	   <form:form  action="/sanantial/tablero/enfermeras" method="post"  name="tableroEnfermerasForm" id="tableroEnfermerasForm">
	   		    <input type="hidden" id="statusToChange" name="statusToChange" value="factt" />
	   		     <input type="hidden" id="citaToChange" name="citaToChange" value="1" />
	   		   <input type="hidden" id="tratamientoDeleted" name="tratamientoDeleted" value="1" />
	   		    <input type="hidden" id="enfermeraToAdd" name="enfermeraToAdd" value="1" />
	   		    <textarea id="observationsToSave" name="observationsToSave" style="display:none;"></textarea>
	   		       
				<table border="0" width="100%" class="hovertable">
				 <tr>
                    <th>Nombre</th><th>Hora</th><th>Tratamiento</th><th>Estatus</th><th>Operaciones</th><th>Enfermera</th>
                </tr>
					<c:forEach items="${listaCitas}" var="citas">
			
						<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';" >
					
					         <td><c:out value="${citas.paciente.pacienteNombre}" />&nbsp;<c:out value="${citas.paciente.pacienteApellidoPat}" /></td>
					         <td><c:out value="${citas.hora}" /></td>
					         <td>
					           <c:forEach items="${citas.tratamientos}" var="tratamiento">
					              <c:out value="${tratamiento.tratamientoNombre}" />
					                <c:if test="${citas.status != 'Terminada'}">
						              	<button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:quitarTratamiento('${citas.citasId}','${tratamiento.tratamientoId}')"><img src="<c:url value="/images/delete.png" />" width="20px" height="20px"  title="Quitar .." style="cursor: pointer;"></img></button>		
						              &nbsp;
					                </c:if>
					           </c:forEach>
					         </td>
					         <td><c:out value="${citas.status}" />
					         <c:if test="${citas.status == 'Sala Espera'}">
					         <img src="<c:url value="/images/warning.png" />" width="20" height="20" title="en espera" ></img>
					         </c:if>
					         </td>
					         <td align="center">
					         <c:if test="${citas.status != 'Terminada'}">
					            <c:url var="UrlAgregarTratamientos" value="/agregar/tratamiento?citasId=${citas.citasId}&viewToBack=tableroEnfermeras" />
					            <a href="${UrlAgregarTratamientos}"><img src="<c:url value="/images/add.png" />" width="20" height="20" title="agregar tratamiento" ></img></a>
					            <c:url var="returnUrlHist" value="/historial/tratamientos?pacienteId=${citas.paciente.pacienteId}" />
							    <a href="${returnUrlHist}"><img src="<c:url value="/images/folder.png" />" width="20" height="20" title="expediente" ></img></a>
								<button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showChangeStatusWindow('<c:url  value="/tablero/cambiarStatusTablero?citasId=${citas.citasId}" />')"><img src="<c:url value="/images/exit3.png" />" width="20px" height="20px"  title="Pasar a .." style="cursor: pointer;"></img></button>					         
					         	<button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showNotesEnfermeraWindow('<c:url  value="/tablero/agregarNota?citasId=${citas.citasId}" />')"><img src="<c:url value="/images/notes.png" />" width="20px" height="20px"  title="Observaciones" style="cursor: pointer;"></img></button>	
					         </c:if>
					         </td>
					         <td align="center" valign="middle">
					          <c:choose>
    							<c:when test="${empty citas.enfermera}">
					        
					               <select id="enfermerasCombo${citas.citasId}"  > 
						                  <option selected="selected" VALUE='0'>Enfermera</OPTION>
						       			  <c:forEach items="${listaEnfermeras}" var="enfermera">
						       					  <option VALUE='${enfermera.enfermeraId}'>${enfermera.enfermeraNombre}</OPTION>
						                          
				                		  </c:forEach>
					               </select > 
						         <button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0" onclick="javascript:salvarEnfermera('${citas.citasId}')"><img src="<c:url value="/images/nurse.png" />" width="20px" height="20px"  title="Atender" style="cursor: pointer;"></img></button>					         
							
							</c:when>
						    <c:otherwise>
						           <c:out value="${citas.enfermera.enfermeraNombre}" />
						    </c:otherwise>
						    </c:choose>
							</td>
						</tr>
					</c:forEach>
					
				</table>
		</form:form>
		</div>
	</div>




<%@ include file="common/footer.jsp" %>
