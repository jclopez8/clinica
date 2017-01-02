<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/altaTratamiento.js" />">
</script>

	<div id="main">
	  <div id="center">
			<h2>Alta Tratamiento</h2>
			
			
			
		  <form:form modelAttribute="tratamiento" action="/clinicaweb/alta/tratamiento" method="post" name="altaTratamientoForm" id="altaTratamientoForm">
			<table > 
			    <tr>
			      <td>
				    <form:label path="tratamientoNombre">Nombre:</form:label><form:input path="tratamientoNombre"  />
				  </td>
				 <td>
				    <form:label path="precio">Precio:</form:label><form:input path="precio" type="number"/>
				  </td> 
				</tr>
			  
				 <tr>
				  <td> 
				   <button type="button" value="Guardar Tratamiento" onclick="javascript:guardarTratamiento()">Guardar Tratamiento</button>
				  </td>
				  <td>
				  </td>
				  <td>
				  </td>
				  <tr>  
				  <tr>
				    <td>
				        <c:if test="${saved == 'success'}">
			            	<p class="success">Tratamiento Guardado</p>
			            </c:if>
						<c:if test="${saved == 'exist'}">
							<p class="error">el Tratamiento ya existie</p>
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
