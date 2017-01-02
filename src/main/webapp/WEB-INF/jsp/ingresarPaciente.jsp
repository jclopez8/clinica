<%@ include file="common/header.jsp" %>
<%@ include file="common/autoRefresh.jsp" %>

<script type="text/javascript" src="<c:url value="/js/ingresarPaciente.js" />">
	
</script>



	<div id="main">
	  <div id="div_cent_expanded">
			<h2>Tablero ingreso</h2>

	   <form:form  action="/clinicaweb/ingresar/paciente" method="post"  name="ingresarPacienteForm" >
	   		      <input type="hidden" id="statusToChange" name="statusToChange" value="factt" />
	   		     <input type="hidden" id="citasId" name="citasId" value="1" />
	   		        <input type="hidden" id="citaToChange" name="citaToChange" value="1" />
	   		          <input type="hidden" id="tratamientoDeleted" name="tratamientoDeleted" value="1" />
	   		   
	   		       
				<table border="0" width="100%" class="hovertable">
				 <tr>
                    <th>Nombre</th><th>Hora</th><th>Tratamiento</th><th>Estatus</th><th>Operaciones</th>
                </tr>
					<c:forEach items="${listaCitas}" var="citas">
			
						<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
					
					         <td><c:out value="${citas.paciente.pacienteNombre}" />&nbsp;<c:out value="${citas.paciente.pacienteApellidoPat}" /></td>
					         <td><c:out value="${citas.hora}" /></td>
					         <td>
					           <c:forEach items="${citas.tratamientos}" var="tratamiento">
					              <c:out value="${tratamiento.tratamientoNombre}" />&nbsp;
					              	<button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:quitarTratamiento('${citas.citasId}','${tratamiento.tratamientoId}')"><img src="<c:url value="/images/delete.png" />" width="20px" height="20px"  title="Quitar .." style="cursor: pointer;"></img></button>		
					              &nbsp;
					              
					           </c:forEach>
					         </td>
					         <td><c:out value="${citas.status}" /></td>
					         <td align="center">
					         	<c:url var="UrlAgregarTratamientos" value="/agregar/tratamiento?citasId=${citas.citasId}&viewToBack=ingresarPaciente" />
					            <a href="${UrlAgregarTratamientos}"><img src="<c:url value="/images/add.png" />" width="20" height="20" title="agregar tratamiento" ></img></a>
					         
					               <button type="button" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:ingresarPaciente('${citas.citasId}')"> <img border="0" src="<c:url value="/images/return.png" />" width="20px" height="20px" style="cursor: pointer;" title="ingresar paciente.." />	</button> 
					               <%-- <button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showChangeStatusIngrWindow('<c:url  value="/tablero/cambiarStatusTablero?citasId=${citas.citasId}" />')"><img src="<c:url value="/images/exit3.png" />" width="20px" height="20px"  title="Pasar a .." style="cursor: pointer;"></img></button>--%>	
					               
					         </td>
		

						</tr>
					</c:forEach>
					
				</table>
		</form:form>
		</div>
	</div>




<%@ include file="common/footer.jsp" %>
