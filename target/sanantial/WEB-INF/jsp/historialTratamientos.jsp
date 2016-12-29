<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/buscarPaciente.js" />">
	
</script>

	<div id="main">
	  <div id="div_center">
			<h2>Historial</h2>


				<table class="reporte_ventas" border="0" width="100%" >
				 <tr>
                    <th>Fecha</th><th>Enfermera</th><th>Tratamiento</th>
                </tr>
					<c:forEach items="${listaCitas}" var="citas">
			
						  <tr>
					         <td><c:out value="${citas.fecha}" /></td>
					         <td><c:out value="${citas.enfermera.enfermeraNombre}" /></td>
					         <td>
					           <c:forEach items="${citas.tratamientos}" var="tratamiento">
					              <c:out value="${tratamiento.tratamientoNombre}" />&nbsp;
					           </c:forEach>
					         </td>
					         <td>
					             	<button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0" onclick="javascript:showNotesWindow('<c:url  value="/historial/mostrarNota?citasId=${citas.citasId}" />')"><img src="<c:url value="/images/notes.png" />" width="20px" height="20px"  title="Observaciones" style="cursor: pointer;"></img></button>	
					         </td>
					         
						</tr>
						<tr>
						</tr>
					</c:forEach>
					
				</table>

		</div>
	</div>





<%@ include file="common/footer.jsp" %>
