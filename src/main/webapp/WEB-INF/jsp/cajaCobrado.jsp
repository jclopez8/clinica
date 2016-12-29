<%@ include file="common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="<c:url value="/js/caja.js" />">
</script>

<%-- <script type="text/javascript" src="<c:url value="/js/jquery-2.1.0.js" />"></script> --%>

	<div id="main">
	  <div id="div_cent_expanded">
			<form:form  action="/caja/nota" method="post"  id="cajaForm" name="cajaForm" >
			 <input type="hidden" id="citasId" name="citasId" value="${citas.citasId}" />
			 <table border="0" width="100%" height="222" class="caja">
			 
					<tr class="cajatitle">
					    <th width="10%" >
						  <strong><font face="Arial">Clave</font> </strong>
						  </th>
						<th width="16%" >
					      <strong><font face="Arial">Nombre</font> </strong></th>
						<th width="13%" align="center">					
							<img border="0" src="<c:url value="/images/Dollar.png" />" width="20" height="20" align="left" title="efectivo"/>	
							
						</th>
						<th width="13%" align="left">
								<img border="0" src="<c:url value="/images/Credit-Card-icon.png" />" width="20" height="20" align="middle" title="tarjeta"/>	
	                    </th>
						<th width="13%" align="left">
	                         <strong><font face="Arial">Total</font> </strong>
	    				</th>
	    				
		   					<th width="13%" align="left"><font face="Arial">Vale</font></th>
	                    <th width="15%" align="left"><font face="Arial">Descuento</font></th>
	                     <th width="7%"></th>
					</tr>
				
					<tr>
					    <td width="10%"  bgcolor="#FFFFFF">					
						   <font face="Arial"><c:out value="${citas.paciente.pacienteId}" /></font>					
						 </td>
						<td width="16%"   bgcolor="#FFFFFF">
				         <c:out value="${citas.paciente.pacienteNombre}" />
				        </td>
						<td width="13%" >					</td>
						<td width="13%">
	
						</td>
						<td width="13%" >
								
	    				</td>
	    					
		   					<td width="13%" ></td>
	                    <td width="15%">
							                    </td>
	                    <td width="7%"></td>
					</tr>
					<tr class="cajatitle">
					    <td width="10%"></td>
						<td width="16%" >
							<strong>Tratamientos</strong>					
	                    </td>
						<td width="13%" ></td>
						<td width="13%"></td>
	   					<td width="13%" ></td>
	   					<td width="13%" ></td>
	                    <td width="15%"></td>
	                    <td width="7%">
	
<%-- 	                    <button type="button" onclick="javascript:quitarElemento()"><img src="<c:url value="/images/edit_delete.png" />" width="20" height="20" title="quitar este concepto" ></img></button> --%>
	                    </td>
					</tr>
				
            	    <c:set var="totalNeto" value="0" />
            	    <c:set var="totalEfectivo" value="0" />
            	      <c:set var="totalTarjeta" value="0" />
            	    
            	     <c:forEach items="${citas.notaVenta.ventaDiarias}" var="ventas">
						<c:choose>
						<c:when test="${ventas.tratamiento.tratamientoId != '0'}">
						 <tr id="trat${tratamiento.tratamientoId}" >
						 
						    <td width="10%">
						       <input type="number" id="cantidadTratamiento${ventas.tratamiento.tratamientoId}" name="tratamientoCantidad"  value="1"  maxlength="5" style="width: 30px;" readonly/>
						       <input type="hidden" id="${tratamiento.tratamientoId}" name="rowTratamiento" value="${ventas.tratamiento.tratamientoId};" />
						    </td>
							<td width="16%" >
						             <c:out value="${ventas.tratamiento.tratamientoNombre}" />	
						     </td>
							<td width="13%" >
									  <input type="number" id="efectivoTratamiento${ventas.tratamiento.tratamientoId}" name="tratamientoEfectivo"  value="${ventas.descuento!=0?(ventas.tratamiento.precio*(1-(ventas.descuento/100)))-ventas.pagoTarjeta:ventas.tratamiento.precio-ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioTratamiento${ventas.tratamiento.tratamientoId}" name="tratamientoPrecio"  value="${ventas.tratamiento.precio}"   />
									
							</td>
							<td width="13%">
							      		 <input type="number" id="tarjetaTratamiento${ventas.tratamiento.tratamientoId}" name="tratamientoTarjeta"  value="${ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;" readonly />
								      			 <c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 			
							</td>
		   					<td width="13%" >
		   					  <input type="number" id="totalTratamiento${ventas.tratamiento.tratamientoId}" name="tratamientoTotal"  value="${ventas.descuento!=0?(ventas.tratamiento.precio)*(1-(ventas.descuento/100)):(ventas.tratamiento.precio)}"  maxlength="5" style="width: 50px;" readonly />
		   					  <c:set var="totalNeto" value="${ventas.descuento!=0?totalNeto + (ventas.tratamiento.precio)*(1-(ventas.descuento/100)):totalNeto + (ventas.tratamiento.precio)}" /> 			  
		   					</td>
		   					<td width="13%" >	
		   					
		   					<c:out value="${ventas.vale}" />	
 				   					     				 
		   					</td>
		                    <td width="15%">
		                		<img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
		                    	
		                    	<c:out value="${ventas.descuento}" />
		                    	

		                    </td>
		                    <td width="7%">
		                      	
		                    </td>
						  </tr>   
						  
						  </c:when>
						</c:choose>	           
					  </c:forEach>
					
					<tr class="cajatitle">
					    <td width="10%"></td>
						<td width="16%" >
							<strong>Consultas</strong>					
	                    </td>
						<td width="13%" ></td>
						<td width="13%"></td>
	   					<td width="13%" ></td>
	   					<td width="13%" ></td>
	                    <td width="15%">
	                     <input type="hidden" id="hiddenConsultaId" name="hiddenConsultaId" value="" /> 
					     <input type="hidden" id="hiddenConsultaNombre" name="hiddenConsultaNombre" value="" /> 
						 <input type="hidden" id="idConsulta" name="idConsulta" value="" />
	                    </td>
	                    <td width="7%"></td>
					</tr>
					
					 <c:forEach items="${citas.notaVenta.ventaDiarias}" var="ventas">
					  <c:choose>
						<c:when test="${ventas.consulta.consultaId != '0'}">
						
						<tr id="venta${ventas.ventaId}" >
						
						    	    <td width="10%">
								      <input type="number" id="cantidadConsulta${ventas.consulta.consultaId}" name="consultaNum"  value="1"  maxlength="5" style="width: 30px;" readonly/>
										<input type="hidden" id="${ventas.consulta.consultaId}" name="rowConsulta" value="${ventas.ventaId};${ventas.consulta.consultaId};" />
								    
								    </td>
									<td width="16%" >
								    	<c:out value="${ventas.consulta.consultaNombre}" />&nbsp;
								              
								     </td>
									<td width="13%" >
								        <input type="number" id="efectivoConsulta${ventas.consulta.consultaId}" name="consultaEfectivo"  value="${ventas.descuento!=0?(ventas.consulta.precio*(1-(ventas.descuento/100)))-ventas.pagoTarjeta:ventas.consulta.precio-ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioConsulta${ventas.consulta.consultaId}" name="consultaPrecio"  value="${ventas.consulta.precio}"   />
										
										
									</td>
									<td width="13%">
										 <input type="number" id="tarjetaConsulta${ventas.consulta.consultaId}" name="consultaTarjeta"  value="${ventas.pagoTarjeta!=null?ventas.pagoTarjeta:0}"  maxlength="5" style="width: 50px;" readonly />
									 <c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 	
									</td>
				   					<td width="13%" >
				   						 <input type="number" id="totalConsulta${ventas.consulta.consultaId}" name="consultaTotal"  value="${ventas.descuento!=0? (ventas.consulta.precio*(1-(ventas.descuento/100))): (ventas.consulta.precio)}"  maxlength="5" style="width: 50px;" readonly/>
				  				  		 <c:set var="totalNeto" value="${ventas.descuento!=0?totalNeto + (ventas.consulta.precio*(1-(ventas.descuento/100))):totalNeto + (ventas.consulta.precio)}" /> 	
				   					</td>
				   					<td width="13%" >  	
					                   
				   					</td>
				                    <td width="15%">
						                    <img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
					                    	<c:out value="${ventas.descuento}" />
				                    </td>
				                    <td width="7%">
					                  
					                    <input type="hidden" id="hiddenConsultaId" name="hiddenConsultaId" value="${ventas.consulta.consultaId}" /> 
						     			<input type="hidden" id="hiddenConsultaNombre" name="hiddenConsultaNombre" value="${ventas.consulta.consultaNombre}" /> 
				                    </td>
						 
						 </tr>

					 	</c:when>
						</c:choose>	              
					  </c:forEach>
					  
					<tr class="cajatitle">
					    <td width="10%"></td>
						<td width="16%" >
							<strong>Medicamento</strong>					
	                    </td>
						<td width="13%" ></td>
						<td width="13%"></td>
	   					<td width="13%" ></td>
	   					<td width="13%" ></td>
				   	   <td width="15%"></td>
	                    <td width="7%"></td>
					</tr>
					 <c:forEach items="${citas.notaVenta.ventaDiarias}" var="ventas">
					 <c:choose>
							 <c:when test="${ventas.medicamento.medicamentoId != '0'}">
								 <tr id="venta${ventas.ventaId}" >
								    <td width="10%">
								         <input type="number" id="cantidadMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoNum"  value="${ventas.cantidad}"  maxlength="5" style="width: 30px;"  readonly  />
										 <input type="hidden" id="${ventas.medicamento.medicamentoId}" name="rowMedicamento" value="${ventas.ventaId};${ventas.medicamento.medicamentoId};" />
								    
								    </td>
									<td width="16%" >
								    	<c:out value="${ventas.medicamento.medicamentoNombre}" />&nbsp;
								              
								     </td>
									<td width="13%" >
									    <input type="number" id="efectivoMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoEfectivo"  value="${ventas.descuento!=0?(ventas.cantidad*ventas.medicamento.precio*(1-ventas.descuento/100))-ventas.pagoTarjeta:(ventas.cantidad*ventas.medicamento.precio)-ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoPrecio"  value="${ventas.medicamento.precio}"   />
									</td>
									<td width="13%">
										 <input type="number" id="tarjetaMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoTarjeta"  value="${ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;" readonly />
										 <c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 	
									</td>
				   					<td width="13%" >
				   					     <input type="number" id="totalMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoTotal"  value="${ventas.descuento!=0?((ventas.cantidad)*(ventas.medicamento.precio)*(1-ventas.descuento/100)):ventas.cantidad*ventas.medicamento.precio}"  maxlength="5" style="width: 50px;" readonly />
<%-- 				   					      <c:set var="totalMedicamento" value="${ventas.descuento!=0?ventas.cantidad*ventas.medicamento.precio*ventas.descuento:ventas.cantidad*ventas.medicamento.precio}" /> --%>
<%-- 				   					     <fmt:formatNumber type="number" maxIntegerDigits="5" value="totalMedicamento" /> --%>
				   					     <c:set var="totalNeto" value="${ventas.descuento!=0?totalNeto + ventas.cantidad*(ventas.medicamento.precio*(1-ventas.descuento/100)):totalNeto + ventas.cantidad*(ventas.medicamento.precio)}" /> 	
				   					</td>
				   					<td width="13%" >
				   					       
				   					</td>
				                    <td width="15%">
						                    <img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
					                    	<c:out value="${ventas.descuento}" />
				                    </td>
				                    <td width="7%">
				                    	
				                    </td>
								  </tr>
							</c:when>
						</c:choose>	              
					  </c:forEach>
					<tr class="cajatitle">
					    <td width="10%"></td>
						<td width="16%" >
							<strong>Total</strong>					
	                    </td>
						<td width="13%" >
							 <input type="text" id="totalEfectivo" name="EfectivoTotal" value="${totalNeto-totalTarjeta}" maxlength="5" style="width: 50px;" readonly />
						</td>
						<td width="13%">
 							<input type="text" id="totalTarjeta" name="tarjetaTotal" value="${totalTarjeta}" maxlength="5" style="width: 50px;" readonly /> 
						</td>
	   					<td width="13%" >
	   					
	   						<input type="text" id="totalAll" name="allTotal" value="${totalNeto}" maxlength="5" style="width: 50px;" readonly />
	   					
	   					</td>
	   					<td width="13%" ></td>
	                    <td width="15%"></td>
	                    <td width="7%"></td>
					</tr>
				</table>
                <table>
 					<tr> <c:out value="Nota Pagada" />&nbsp;</tr>
	          </table>
			</form:form>
			 
		</div>
	</div>





<%@ include file="common/footer.jsp" %>
