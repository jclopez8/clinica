<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/buscarPaciente.js" />">
	
</script>

	<div id="main">
	  <div id="center">
			<h2>Buscar Paciente <c:choose><c:when test = "${reporteMedico == 'true'}">para acceder al Reporte Medico</c:when></c:choose></h2>
			 <form:form  action="/sanantial/buscar/paciente" method="post"  name="buscarPacienteForm" >
		     	<table   width="100%" height="230">
					<tr>
					    <td width="16%" height="94">
						  <strong>Nombre:</strong>
						  <input type="hidden" name="reporteMedico" value="<c:out value="${reporteMedico}" />">
					    </td>
						<td width="27%">
				        <input id="pacienteNom" name="pacienteNom" size="10" type="text" style="font-size:12px; vertical-align:middle	; height:11px; width:225px;" />
						</td>
						<td width="20%">	
						
						<button type="button" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:buscarPaciente()"> <img border="0" src="<c:url value="/images/lupa.png" />" width="20px" height="20px" align="left"/>	</button>				
						</td>
						<td width="37%">					
						</td>
					</tr>
				</table>
				<table border="0" width="100%" class="lista">
				 <tr>
                    <th>CURP</th><th>Nombre</th><th>Apellido Paterno</th><th>Apellido Materno</th><th>Fecha Nacimiento</th>
                    <th>Ingresar <c:choose><c:when test = "${reporteMedico == 'true'}">al Reporte Medico</c:when></c:choose>
                    </th>
                </tr>
					<c:forEach items="${listaPacientes}" var="paciente">
					  
						<tr align="center">
					         <td><c:out value="${paciente.curp}" /></td>
					         <td><c:out value="${paciente.pacienteNombre}" /></td>
					  	     <td><c:out value="${paciente.pacienteApellidoPat}" /></td>
					         <td><c:out value="${paciente.pacienteApellidoMat}" /></td>
					          <td><c:out value="${paciente.fechaNac}" /></td>
					         <td>
					         	<c:choose>
					         		<c:when test = "${reporteMedico == 'true'}">
										<button type="button" onclick="javascript:altaReporteMedico('${paciente.pacienteId}')" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;cursor: pointer;">
						          			<img border="0" src="<c:url value="/images/return.png" />" width="20px" height="20px" align="left" />	
						          		</button>
									</c:when>
									<c:otherwise>
										<button type="button" onclick="javascript:altaPaciente('${paciente.pacienteId}')"   style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;cursor: pointer;">
						          			<img border="0" src="<c:url value="/images/return.png" />" width="20px" height="20px" align="left"/>	
						          		</button>
									</c:otherwise>
					          	</c:choose>
					         </td>
						</tr>
					</c:forEach>
					
<%-- 					<c:url var="returnUrl" value="/alta/cita?pacienteId=${paciente.pacienteId}" /> --%>
					
				</table>
			</form:form>
		</div>
	</div>





<%@ include file="common/footer.jsp" %>
