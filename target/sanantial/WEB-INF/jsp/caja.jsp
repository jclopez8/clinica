<%@ include file="common/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/caja.js" />">
</script>

<%-- <script type="text/javascript" src="<c:url value="/js/jquery-2.1.0.js" />"></script> --%>

	<div id="main">
	  <div id="div_cent_expanded">
			<form:form  action="/sanantial/caja/nota" method="post"  id="cajaForm" name="cajaForm" >
			 <input type="hidden" id="citasId" name="citasId" value="${citas.citasId}" />
			 <table border="0" width="100%" height="222" class="caja">
			 
					<tr class="cajatitle">
					    <th width="10%" >
						  <strong><font face="Arial">Clave</font> </strong>
						  </th>
						<th width="16%" >
					      <strong><font face="Arial">Nombre</font> </strong></th>
						<th width="13%">					
							<img border="0" src="<c:url value="/images/Dollar.png" />" width="20" height="20" align="left" title="efectivo"/>	
							
						</th>
						<th width="13%">
								<img border="0" src="<c:url value="/images/Credit-Card-icon.png" />" width="20" height="20" align="middle" title="tarjeta"/>	
	                    </th>
						<th width="13%" >
	                         <strong><font face="Arial">Total</font> </strong>
	    				</th>
	    				
		   					<th width="13%" ></th>
	                    <th width="15%">
	                    
	                    </th>
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
	                    <td width="7%">
	                                <c:url var="returnUrlHist" value="/historial/tratamientos?pacienteId=${citas.paciente.pacienteId}" />
							   		 <a href="${returnUrlHist}"><img src="<c:url value="/images/folder.png" />" width="20" height="20" title="expediente" ></img></a>
	                    </td>
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
	
	                    <button type="button" onclick="javascript:quitarElemento()"><img src="<c:url value="/images/edit_delete.png" />" width="20" height="20" title="quitar este concepto" ></img></button>
	                    </td>
					</tr>
				
            	    <c:set var="totalNeto" value="0" />
            	     <c:set var="totalTarjeta" value="0" />
            	             	     

					 <c:forEach items="${citas.tratamientos}" var="tratamiento">
						 <tr id="trat${tratamiento.tratamientoId}" >
						 
						    <td width="10%">
						       <input type="number" id="cantidadTratamiento${tratamiento.tratamientoId}" name="tratamientoCantidad"  value="1"  maxlength="5" style="width: 30px;" onkeypress="" readonly/>
						       <input type="hidden" id="${tratamiento.tratamientoId}" name="rowTratamiento" value="${tratamiento.tratamientoId};" />
						    </td>
							<td width="16%" >
						             <c:out value="${tratamiento.tratamientoNombre}" />	
						     </td>
							<td width="13%" >
									  <input type="number" id="efectivoTratamiento${tratamiento.tratamientoId}" name="tratamientoEfectivo"  value="${tratamiento.precio}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioTratamiento${tratamiento.tratamientoId}" name="tratamientoPrecio"  value="${tratamiento.precio}"   />
									
							</td>
							<td width="13%">
							      		 <input type="number" id="tarjetaTratamiento${tratamiento.tratamientoId}" name="tratamientoTarjeta"  value="0"  maxlength="5" style="width: 50px;"  onblur="javascript:ajustarPagoTarjeta('${tratamiento.tratamientoId}','Tratamiento')"/>
								      	<c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 			
							</td>
		   					<td width="13%" >
		   					 <input type="number" id="totalTratamiento${tratamiento.tratamientoId}" name="tratamientoTotal"  value="${tratamiento.precio}"  maxlength="5" style="width: 50px;" onkeypress="" readonly="readonly"/>
		   					 <input type="hidden" id="totalTratamientoHidden${tratamiento.tratamientoId}" name="tratamientoTotalHidden"  value="${tratamiento.precio}" />
		   					  <c:set var="totalNeto" value="${totalNeto + tratamiento.precio}" /> 			  
		   					</td>
		   					<td width="13%" >	
				                       <select id="valeComboTratamiento${tratamiento.tratamientoId}" > 
				                            <option VALUE="0">Vale</OPTION>
				                            <option VALUE="100">$100</OPTION>
				                            <option VALUE="200">$200</OPTION>
				                            <option VALUE="400">$400</OPTION>
				                         </select>  				   					     				
		   					</td>
		                    <td width="15%">
		                		<img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
		                    	<select id="descuentoDrComboTratamiento${tratamiento.tratamientoId}" onchange="javascript:agregarDescuento('${tratamiento.tratamientoId}',this,'Tratamiento')" > 
		                             <option VALUE="1">0%</OPTION>
					                            <option VALUE=".95">5%</OPTION>
					                            <option VALUE=".90">10%</OPTION>
					                            <option VALUE=".80">20%</OPTION>
					                              <option VALUE=".70">30%</OPTION>
					                            <option VALUE=".60">40%</OPTION>
					                            <option VALUE=".50">50%</OPTION>
					                            <option VALUE="0">100%</OPTION>
                         		</select > 
		                    </td>
		                    <td width="7%">
		                      	<input id="${tratamiento.tratamientoId}" name="checkToDeleteTratamiento" type="checkbox"  onclick=""/>
		                    </td>
						  </tr>            
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
								      <input type="number" id="cantidadConsulta${ventas.consulta.consultaId}" name="consultaNum"  value="1"  maxlength="5" style="width: 30px;" onclick="" readonly/>
										<input type="hidden" id="${ventas.consulta.consultaId}" name="rowConsulta" value="${ventas.ventaId};${ventas.consulta.consultaId};" />
								    
								    </td>
									<td width="16%" >
								    	<c:out value="${ventas.consulta.consultaNombre}" />&nbsp;
								              
								     </td>
									<td width="13%" >
								        <input type="number" id="efectivoConsulta${ventas.consulta.consultaId}" name="consultaEfectivo"  value="${ventas.consulta.precio}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioConsulta${ventas.consulta.consultaId}" name="consultaPrecio"  value="${ventas.consulta.precio}"   />
										
										
									</td>
									<td width="13%">
										 <input type="number" id="tarjetaConsulta${ventas.consulta.consultaId}" name="consultaTarjeta"  value="${ventas.pagoTarjeta!=null?ventas.pagoTarjeta:0}"  maxlength="5" style="width: 50px;"   onblur="javascript:ajustarPagoTarjeta('${ventas.consulta.consultaId}','Consulta')"/>
									 	  <c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 	
									
									</td>
				   					<td width="13%" >
				   						 <input type="number" id="totalConsulta${ventas.consulta.consultaId}" name="consultaTotal"  value="${ventas.consulta.precio}"  maxlength="5" style="width: 50px;" onkeypress="" readonly="readonly"/>
				  				  		 <input type="hidden" id="totalConsultaHidden${ventas.consulta.consultaId}" name="consultaTotalHidden"  value="${ventas.consulta.precio}"  />
				  				  		 
				  				  		 <c:set var="totalNeto" value="${totalNeto + ventas.consulta.precio}" /> 	
				   					</td>
				   					<td width="13%" >  	
					                   
				   					</td>
				                    <td width="15%">
						                    <img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
					                    	<select id="descuentoDrComboConsulta${ventas.consulta.consultaId}" onchange="javascript:agregarDescuento('${ventas.consulta.consultaId}',this,'Consulta')" > 
					                              <option VALUE="1">0%</OPTION>
					                            <option VALUE=".95">5%</OPTION>
					                            <option VALUE=".90">10%</OPTION>
					                            <option VALUE=".80">20%</OPTION>
					                              <option VALUE=".70">30%</OPTION>
					                            <option VALUE=".60">40%</OPTION>
					                            <option VALUE=".50">50%</OPTION>
					                            <option VALUE="0">100%</OPTION>
			                         		</select > 
				                    </td>
				                    <td width="7%">
					                    <input id="${ventas.ventaId}" name="checkToDelete" type="checkbox"  onclick=""/>
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
								         <input type="number" id="cantidadMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoNum"  value="${ventas.cantidad}"  maxlength="5" style="width: 30px;"  onclick="javascript:ajustarCantidad('${ventas.medicamento.medicamentoId}','Medicamento')"  />
										 <input type="hidden" id="${ventas.medicamento.medicamentoId}" name="rowMedicamento" value="${ventas.ventaId};${ventas.medicamento.medicamentoId};" />
								    
								    </td>
									<td width="16%" >
								    	<c:out value="${ventas.medicamento.medicamentoNombre}" />&nbsp;
								              
								     </td>
									<td width="13%" >
									    <input type="number" id="efectivoMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoEfectivo"  value="${ventas.medicamento.precio}"  maxlength="5" style="width: 50px;" readonly />
									    <input type="hidden" id="precioMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoPrecio"  value="${ventas.medicamento.precio}"   />
									</td>
									<td width="13%">
										 <input type="number" id="tarjetaMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoTarjeta"  value="${ventas.pagoTarjeta}"  maxlength="5" style="width: 50px;"   onblur="javascript:ajustarPagoTarjeta('${ventas.medicamento.medicamentoId}','Medicamento')"/>
										 <c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> 
									</td>
				   					<td width="13%" >
				   					     <input type="number" id="totalMedicamento${ventas.medicamento.medicamentoId}" name="medicamentoTotal"  value="${ventas.cantidad*ventas.medicamento.precio}"  maxlength="5" style="width: 50px;" onkeypress="" readonly="readonly" />
				   					      <input type="hidden" id="totalMedicamentoHidden${ventas.medicamento.medicamentoId}" name="medicamentoTotalHidden"  value="${ventas.cantidad*ventas.medicamento.precio}"   />
							     	     <c:set var="totalNeto" value="${totalNeto + ventas.cantidad*ventas.medicamento.precio}" /> 	
				   					</td>
				   					<td width="13%" >
				   					       
				   					</td>
				                    <td width="15%">
						                    <img id="descuentoImgDr"  border="0" src="<c:url value="/images/descuento.jpg" />" width="15" height="15" align="left" title="descuento"/>
					                    	<select id="descuentoDrComboMedicamento${ventas.medicamento.medicamentoId}" onchange="javascript:agregarDescuento('${ventas.medicamento.medicamentoId}',this,'Medicamento')" > 
					                             <option VALUE="1">0%</OPTION>
					                            <option VALUE=".95">5%</OPTION>
					                            <option VALUE=".90">10%</OPTION>
					                            <option VALUE=".80">20%</OPTION>
					                              <option VALUE=".70">30%</OPTION>
					                            <option VALUE=".60">40%</OPTION>
					                            <option VALUE=".50">50%</OPTION>
					                            <option VALUE="0">100%</OPTION>
			                         		</select > 
				                    </td>
				                    <td width="7%">
				                    	<input id="${ventas.ventaId}" name="checkToDelete" type="checkbox"  onclick=""/>
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
<%-- 						<c:set var="totalEfetivo" value="${totalNeto-totalTarjeta}" />    --%>
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
                <c:choose>
					<c:when test="${citas.notaVenta.pagada == 'false'}">
						   <tr> <c:out value="Nota Pagada" />&nbsp;</tr>
			 		</c:when>
			 	   <c:otherwise>
		                <tr>
						    <td width="20%" align="center">	
						    
						        <c:url var="UrlAgregarTratamientos" value="/agregar/tratamiento?citasId=${citas.citasId}&viewToBack=caja" />
							           <a href="${UrlAgregarTratamientos}"><button type="button">Agregar Tratamiento</button></a>
						    </td>
							<td width="20%" align="center">
									<input id="addConsulta" name="addConsulta" type="button" value="Agregar Consulta" onclick="javascript:agregarConsulta('<c:url  value="/caja/consulta" />')"/>
									
								 
		
							</td>
							<td width="20%" align="center">
							<c:url var="UrlAgregarMedicamento" value="/agregar/medicamento?citasId=${citas.citasId}&viewToBack=caja" />
							           <a href="${UrlAgregarMedicamento}"><button type="button">Agregar Medicamento</button></a>
							
							</td>
						    <td width="20%">
								
							</td>
							<td width="20%" align="center">
										<input id="Cobrar" name="Cobrar" type="button" value="Cobrar" onclick="javascript:cobrar()"/>
<!-- 								       <input id="Eliminar" name="Eliminar" type="button" value="Eliminar" onclick=""/> -->
							</td>
						</tr>
						</c:otherwise>        
				</c:choose>  
            </table>
			</form:form>
			 
		</div>
	</div>





<%@ include file="common/footer.jsp" %>
