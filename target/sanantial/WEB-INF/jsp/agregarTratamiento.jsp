<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/agregarTratamiento.js" />">
	
</script>



	<div id="main">
	  <div id="center">
			<h2>Agregar Tratamiento</h2>
			 <form:form  action="/sanantial/agregar/tratamiento" method="post"  name="agregarTratamientoForm">
			    <input type="hidden" id="verificadosHist" name="verificadosHist" value="${verificadosHist}" />
		     	    <input type="hidden" id="citasId" name="citasId"  value="${citasId}" />
		     	     <input type="hidden" id="viewToBack" name="viewToBack" value="${viewToBack}" />
		     	
		     	<table border="0" width="100%" height="230">
					<tr>
					    <td width="16%" height="94">
						  <strong>Tratamiento:</strong>
					    </td>
						<td width="27%">
				        <input id="tratamientoNombre" name="tratamientoNombre" size="10" type="text" style="font-size:12px; vertical-align:middle	; height:11px; width:225px;" />
						</td>
						<td width="20%">	
						
						<button type="button" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:buscarTratamiento()"> <img border="0" src="<c:url value="/images/lupa.png" />" width="20" height="20" align="left"/>	</button>				
						</td>
						<td width="37%">					
						</td>
					</tr>
				</table>
				<table >
				  <tr>
				    <td width="40%">
					    <table class="selectList" >
	                   		<c:forEach items="${listaTratamientos}" var="tratamiento">
	                   		  <c:if test="${tratamiento.tratamientoId != '0'}">
			           
		                            <tr>
		                          	     <td><input type="checkbox" name="buscados" id="${tratamiento.tratamientoId}" value="${tratamiento.tratamientoId};${tratamiento.tratamientoNombre};${tratamiento.precio}" /></td>
		                                 <td><c:out value="${tratamiento.tratamientoNombre}" /></td>
	    						         <td><c:out value="${tratamiento.precio}" /></td>
									</tr>
								 	
			            	 </c:if>
								
	                  		 </c:forEach>
	                     </table>
                       </td>
                       <td width="20%" align="center">	
			               <input id="quitar" name="quitar" type="button" value="<<   Quitar   " onclick="javascript:quitarTratamiento()"/>
			               <input id="agregar" name="agregar" type="button" value="Agregar >>" onclick="javascript:agregarTratamiento()"/>
                   	 </td>
					   <td width="40%" >
						   <table class="selectList" id="agregados" >

						   </table>
					   </td>
					</tr>
					<tr>
					   <td>
					      <input id="terminar"  type="button" value="Terminar" onclick="javascript:Terminar()"/>
					      <input id="cancelar"  type="button" value="Cancelar" onclick="javascript:Cancelar()"/>
					   </td>
					   <td>
					    
					   </td>
					</tr>
					
				</table>
			</form:form>
		</div>
	</div>



<%@ include file="common/footer.jsp" %>
