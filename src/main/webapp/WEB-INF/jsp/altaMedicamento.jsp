<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/altaMedicamento.js" />">
</script>

	<div id="main">
	  <div id="center">
			<h2>Alta Medicamento</h2>
			
			
			
		  <form:form modelAttribute="medicamento" action="/sanantial/salvar/medicamento" method="post" name="altaMedicamentoForm" id="altaMedicamentoForm" >
			<table > 
			    <tr>
			      <td>
				    <form:label path="medicamentoNombre">Nombre:</form:label><form:input path="medicamentoNombre" id="medicamentoNombre" type="FreeText"/>
				  </td>
				  <td>
				    <form:label path="laboratorio">Laboratorio:</form:label><form:input path="laboratorio" id="laboratorio" type="FreeText" />
				  </td>
				  <td>
				    <form:label path="precio">Precio:</form:label><form:input path="precio" id="precio" type="number"/>
				  </td> 
				</tr>
			  
				 <tr>
				  <td> 
				   <button type="button" value="Guardar Paciente" onclick="javascript:guardarMedicamento()">Guardar Medicamento</button>
				  </td>
				  <td>
				  </td>
				  <td>
				  </td>
				  <tr>  
				  <tr>
				    <td>
				        <c:if test="${saved == 'success'}">
			            	<p class="success">Medicamento Guardado</p>
			            </c:if>
						<c:if test="${saved == 'exist'}">
							<p class="error">el Medicamento ya existie</p>
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
