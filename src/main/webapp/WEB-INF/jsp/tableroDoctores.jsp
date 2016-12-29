<%@ include file="common/header.jsp" %>
<%@ include file="common/autoRefresh.jsp" %>

<script type="text/javascript">
function showChangeStatusDocsWindow(url){
	newwindow=window.open(url,'name','height=200,width=500');
	if (window.focus) {newwindow.focus();}

	return false;
}

</script>

	<div id="main">
	  <div id="div_cent_expanded">
			<h2>Tablero doctores</h2>

	   <form:form  action="/sanantial/tablero/doctores" method="post"  name="tableroDoctoresForm" id="tableroDoctoresForm">
	   		    <input type="hidden" id="statusToChange" name="statusToChange" value="factt" />
	   		     <input type="hidden" id="citaToChange" name="citaToChange" value="1" />
	   		   
	   		       
				<table border="0" width="100%" class="hovertable">
				 <tr>
                    <th>Nombre</th><th>Hora</th><th>Tratamiento</th><th>Estatus</th><th>Operaciones</th>
                </tr>
					<c:forEach items="${listaCitas}" var="citas">
					
						<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';" >
					
					         <td><c:out value="${citas.paciente.pacienteNombre}" />&nbsp;<c:out value="${citas.paciente.pacienteApellidoPat}" /></td>
					         <td><c:out value="${citas.hora}" /></td>
					         <td>
					           <c:forEach items="${citas.tratamientos}" var="tratamiento">
					              <c:out value="${tratamiento.tratamientoNombre}" />&nbsp;
					           </c:forEach>
					         </td>
					         <td><c:out value="${citas.status}" /></td>
					         <td align="center">
					            <c:url var="reporteMedicoLink" value="/alta/reporte_medico?pacienteId=${citas.paciente.pacienteId}" />
					            <a href="${reporteMedicoLink}"><img src="<c:url value="/images/reportes1.png" />" width="20" height="20" title="Reporte Medico..." ></img></a>
					            <button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showChangeStatusDocsWindow('<c:url  value="/tablero/cambiarStatusTablero?citasId=${citas.citasId}" />')"><img src="<c:url value="/images/exit3.png" />" width="20px" height="20px"  title="Pasar a .." style="cursor: pointer;"></img></button>	
					         </td>
						</tr>
					</c:forEach>
					
				</table>
		</form:form>
		</div>
	</div>




<%@ include file="common/footer.jsp" %>
