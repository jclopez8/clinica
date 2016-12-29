<%@ include file="common/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="<c:url value="/js/reporteVentaDiaria.js" />">
</script>

	<div id="main">
	  <div id="center">
			<h2>Reporte Ventas</h2>
			
			<table class="reporte_ventas" > 
				<tr>
                    <th>Descripcion</th><th>Cantidad</th><th>Precio</th><th>Descuento</th><th>Efectivo</th><th>Tarjeta</th><th>Total</th><th>Vendido</th>
                </tr>
                <c:set var="totalTarjeta" value="0" />
                <c:set var="totalVentas" value="0" />
                
				<c:forEach items="${ventaDiaria}" var="ventas">
				    <tr align="center">
				    	<c:choose>
				    		<c:when test="${ventas.medicamento.medicamentoId != '0'}">
				    			<td><c:out value="${ventas.medicamento.medicamentoNombre}"></c:out></td>
				    			<td><c:out value="${ventas.cantidad}"></c:out></td>
				    			<td><c:out value="${ventas.medicamento.precio}"></c:out></td>
				    			<td><c:out value="${ventas.descuento}"></c:out></td>
				    			<c:choose>
				    				<c:when test="${empty ventas.pagoTarjeta}">
				    					<td>
				    						 <fmt:formatNumber var="j" maxFractionDigits="2"  type="number" value="${(ventas.cantidad)*(ventas.medicamento.precio)*(1-ventas.descuento/100)}" />
				    						
				    						<c:out  value="${j}"></c:out>
				    					</td>
				    				</c:when>
				    				<c:otherwise>
				    					<td>
				    					    <fmt:formatNumber var="i" maxFractionDigits="2" type="number" value="${((ventas.cantidad)*(ventas.medicamento.precio)*(1-ventas.descuento/100)) - ventas.pagoTarjeta}" />
				    						<c:out value="${i}"></c:out>
				    					</td>
				    				</c:otherwise>
				    			</c:choose>
				    			<td><c:out value="${ventas.pagoTarjeta}"></c:out></td>
				    			<td>
				    				<fmt:formatNumber var="k" maxFractionDigits="2" type="number" value="${(ventas.cantidad)*(ventas.medicamento.precio)*(1-ventas.descuento/100)}" />
				    				<c:out value="${k}"></c:out>
				    			</td>
				    			<td><c:out value="${ventas.usuario.usuarioNombre}"></c:out></td>
				    			<c:set var="totalVentas" value="${totalVentas + ((ventas.cantidad)*(ventas.medicamento.precio)*(1-ventas.descuento/100))}" />
				    			<c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" />
				    		</c:when>
				    		<c:when test="${ventas.tratamiento.tratamientoId != '0'}">
				    			<td><c:out value="${ventas.tratamiento.tratamientoNombre}"></c:out></td>
				    			<td><c:out value="${ventas.cantidad}"></c:out></td>
				    			<td><c:out value="${ventas.tratamiento.precio}"></c:out></td>
				    			<td><c:out value="${ventas.descuento}"></c:out></td>
				    			<c:choose>
				    				<c:when test="${empty ventas.pagoTarjeta}">
				    					<td><c:out value="${(ventas.tratamiento.precio)*(1-ventas.descuento/100)}"></c:out></td>
				    				</c:when>
				    				<c:otherwise>
				    					<td><c:out value="${(ventas.tratamiento.precio*(1-ventas.descuento/100))- ventas.pagoTarjeta}"></c:out></td>
				    				</c:otherwise>
				    			</c:choose>
				    			<td><c:out value="${ventas.pagoTarjeta}"></c:out></td>
				    			<td><c:out value="${(ventas.tratamiento.precio*(1-ventas.descuento/100))}"></c:out></td>
				    			<td><c:out value="${ventas.usuario.usuarioNombre}"></c:out></td>
				    			<c:set var="totalVentas" value="${totalVentas + (ventas.tratamiento.precio*(1-ventas.descuento/100))}" />
				    			<c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" />
				    		</c:when>
				    	</c:choose>
				    	
				    	
				    </tr> 
				</c:forEach>
			</table>
			
			<table>
				<tr align="center">
					<td>
				    <strong>Total Efectivo $ 
						<c:out value="${totalVentas - totalTarjeta}"></c:out>
					</strong>
					</td>
					<td><strong>Total tarjeta $ 
						<img border="0" src="<c:url value="/images/Credit-Card-icon.png"/>" width="20" height="20" align="left" title="tarjeta"></img>
						<c:out value="${totalTarjeta}"></c:out>
					</strong></td>
					<td>
					<strong>Total Venta Dia $ 
					<img border="0" src="<c:url value="/images/Dollar.png"/>" width="20" height="20" align="left" title="efectivo"></img>
					<c:out value="${totalVentas}"></c:out></strong>
					</td>
				</tr>
			</table>
			
			
			<form:form  action="/buscar/reporte_ventas" method="post"  name="reporteVentasForm" id="reporteVentasForm">
	   		    <input type="hidden" id="idGastos" name="idGastos" value="" />
	   		    <input type="hidden" id="idIngresos" name="idIngresos" value="" />  
	   		    
	   		      
			<table>
				<tr>
					<td>
						<h2>Ingresos 
					        <button type="button" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showCatalogo('<c:url value="/agregar_ingresos" />')">
					        	<img border="0" src='<c:url value="/images/add.png"/>' width="20" height="20" align="bottom" title="agregar ingresos"></img>
					        </button>		
						</h2>
					</td>
				</tr>
			</table>
			
			<table class="reporte_ventas">
				<tr>
					<th>Descripcion</th><th>Total</th><th>Agrego</th><th>Eliminar</th>
				</tr>
				<c:set var="totalIngreso" value="0" />
				<c:forEach items="${ingresoDiario}" var="ingresos">
					<tr align="center">
						<td><c:out value="${ingresos.ingreso.ingresoNombre}"></c:out></td>
						<td><c:out value="${ingresos.ingreso.totalIngreso}"></c:out></td>
						<c:set var="totalIngreso" value="${totalIngreso + ingresos.ingreso.totalIngreso}" />
						<td><c:out value="${ingresos.usuario.usuarioNombre}"></c:out></td>  
						<td><button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:quitarIngreso('${ingresos.ingresoDiarioId}')"><img src="<c:url value="/images/delete.png" />" width="20px" height="20px"  title="Quitar .." style="cursor: pointer;"></img></button>	
						</td>  
					</tr>
					<input type="hidden" id="hiddenIngresoId" name="hiddenIngresoId" value="${ingresos.ingreso.ingresoId}" /> 
					<input type="hidden" id="hiddenIngresoNombre" name="hiddenIngresoNombre" value="${ingresos.ingreso.ingresoNombre}" /> 
				</c:forEach>
			</table>
			<table>
				<tr>
					<td><strong>Total <c:out value="${totalIngreso}"></c:out></strong></td>
				</tr>
			</table>
	   		    
	   		    
			<table>
				<tr>
					<td>
						<h2>Gastos 
						    <button type="button" style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:showCatalogo('<c:url value="/agregar_gastos" />')">
					        	<img border="0" src='<c:url value="/images/add.png"/>' width="20" height="20" align="bottom" title="agregar gastos"></img>
					        </button>
						</h2>
					</td>
				</tr>
			</table>
			
			<table class="reporte_ventas">
				<tr>
					<th>Descripcion</th><th>Total</th><th>Agrego</th><th>Eliminar</th>
				</tr>
				<c:set var="totalGasto" value="0" />
				<c:forEach items="${gastoDiario}" var="gastos">
					<tr align="center">
						<td><c:out value="${gastos.gasto.conceptoGasto}"></c:out></td>
						<td><c:out value="${gastos.gasto.totalGasto}"></c:out></td>
						<c:set var="totalGasto" value="${totalGasto + gastos.gasto.totalGasto}" />
						<td><c:out value="${gastos.usuario.usuarioNombre}"></c:out></td>
						<td><button type="button"  style="width:23px;height:23px;padding-left: 0;padding-right: 0;padding-bottom: 0;padding-top: 0;background: transparent;border: none;" onclick="javascript:quitarGasto('${gastos.gastoDiarioId}')"><img src="<c:url value="/images/delete.png" />" width="20px" height="20px"  title="Quitar .." style="cursor: pointer;"></img></button>	
						</td> 
					</tr>
					<input type="hidden" id="hiddenGastoId" name="hiddenGastoId" value="${gastos.gasto.gastoId}" /> 
					<input type="hidden" id="hiddenGastoNombre" name="hiddenGastoNombre" value="${gastos.gasto.conceptoGasto}" /> 
				</c:forEach>
			</table>
			
			<table>
				<tr>
					<td><strong>Total <c:out value="${totalGasto}"></c:out></strong></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<h2>Vales</h2>
					</td>
				</tr>
			</table>
			
			<table class="reporte_ventas" > 
				<tr>
                    <th>Tratamiento</th><th>Total Vale</th><th>Vendido</th>
                </tr>
<%--                 <c:set var="totalTarjeta" value="0" /> --%>
                <c:set var="totalVales" value="0" />
                
				<c:forEach items="${ventaDiaria}" var="ventas">
				    <tr align="center">
				    	<c:choose>
				    		<c:when test="${ventas.tratamiento.tratamientoId != '0' && ventas.vale!='0'}">
				    			<td><c:out value="${ventas.tratamiento.tratamientoNombre}"></c:out></td>
				       			<td><c:out value="${ventas.vale}"></c:out></td>
				    			<td><c:out value="${ventas.usuario.usuarioNombre}"></c:out></td>
				    			<c:set var="totalVales" value="${totalVales + ventas.vale}" />
				    		</c:when>
				    		
				    	</c:choose>
<%-- 				    	<c:set var="totalTarjeta" value="${totalTarjeta + ventas.pagoTarjeta}" /> --%>
				    	
				    </tr> 
				</c:forEach>
			</table>
			
			<table>
				<tr>
					<td><strong>Total <c:out value="${totalVales}"></c:out></strong></td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td><strong>Total Dia $<c:out value="${totalVentas+ totalIngreso - totalGasto}"></c:out></strong></td>
				</tr>
			</table>
			
			</form:form>
			
			
		</div>
	</div>



<script type="text/javascript">

	$(function() {
		$("#save").click(function(event) {
        	$("#user").attr("action", "/buscar/reporte_ventas")
			$("#user").submit();
		});
		
	});
</script>

<%@ include file="common/footer.jsp" %>
