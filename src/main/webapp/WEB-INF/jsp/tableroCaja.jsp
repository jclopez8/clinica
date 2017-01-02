<%@ include file="common/header.jsp" %>
<%@ include file="common/autoRefresh.jsp" %>

	<div id="main">
	  <div id="div_cent_expanded">
			<h2>Tablero Caja</h2>

	   <form:form  action="/clinicaweb/tablero/doctores" method="post"  name="tableroDoctoresForm" id="tableroDoctoresForm">
	   		    <input type="hidden" id="statusToChange" name="statusToChange" value="factt" />
	   		     <input type="hidden" id="citaToChange" name="citaToChange" value="1" />
	   		   
	   		       
				<table border="0" width="100%" class="hovertable">
				 <tr>
                    <th>Nombre</th><th>Hora</th><th>Tratamiento</th><th>Estatus</th>
                </tr>
					<c:forEach items="${listaCitas}" var="citas">
			             <c:url var="cajaNotaLink" value="/caja/nota?citasId=${citas.citasId}" />
						<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';" onclick="window.location.href = '${cajaNotaLink}'">
					
					         <td><c:out value="${citas.paciente.pacienteNombre}" />&nbsp;<c:out value="${citas.paciente.pacienteApellidoPat}" /></td>
					         <td><c:out value="${citas.hora}" /></td>
					         <td>
					           <c:forEach items="${citas.tratamientos}" var="tratamiento">
					              <c:out value="${tratamiento.tratamientoNombre}" />&nbsp;
					           </c:forEach>
					         </td>
					         <td><c:out value="${citas.status}" /></td>
		

						</tr>
					</c:forEach>
					
				</table>
		</form:form>
		</div>
	</div>




<%@ include file="common/footer.jsp" %>
