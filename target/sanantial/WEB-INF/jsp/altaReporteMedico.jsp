<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/altaReporteMedico.js" />">
</script>
		<div id="main">
		  <div id="center" align="center">
				<h2>Reporte Medico</h2>
				
				
				<form:form modelAttribute="paciente" action="/salvar/reporte_medico" method="post" name="reporteMedicoForm" id="reporteMedicoForm" acceptcharset="ISO-8859-1">
				
				<table>
                <tbody>
                    <tr>
                       <td>
                            <table>
                               <tbody>
                               <c:if test="${saved == 'success'}">
                               <tr>
                               		<td colspan="2">
							           <p class="success">Reporte Medico Guardado</p>
                               		</td>
                               </tr>
                               </c:if>
                                <tr>
                                   <td>
                                     <strong>Dr.</strong>
                                   </td>
                                   <td>
                                     ${usuario.usuarioNombre}
                                   </td>
                                </tr>
                               </tbody>
                             </table> 
                       </td>
                    </tr> 
                    <tr>
                       <td>
                            <table style="border:1px solid white;">
                               <tbody>
                                <tr>
                                   <td>
                                       <form:label path="pacienteNombre">Paciente:</form:label> 
                                       <form:hidden path="pacienteId" />
                                   </td>
                                   <td >
                                   		<form:input path="pacienteNombre" readonly="true"/>
                                   </td>
                                   <td>
                                   		<form:input path="pacienteApellidoPat" readonly="true"/>
                                   </td>
                                   <td>
                                   		<form:input path="pacienteApellidoMat" readonly="true"/>
                                   </td>
                                   <td align="center">&nbsp;&nbsp;&nbsp;
                                     <c:url var="returnUrlHist" value="/historial/tratamientos?pacienteId=${paciente.pacienteId}" />
							   		 <a href="${returnUrlHist}"><img src="<c:url value="/images/folder.png" />" width="20" height="20" title="expediente" ></img></a>
                                   </td>
                                </tr>
                                <tr>
                                   <td>
                                   		<form:label path="sexo">Sexo:</form:label> 
                                   </td>
                                   <td>
                                   		<form:input path="sexo" readonly="true"/>
                                   </td>
                                   <td>
                                    	<form:label path="fechaNac">Fecha de nacimiento:</form:label> 
                                   </td>
                                   <td>
                                   		<form:input path="fechaNac" readonly="true"/>
                                   </td>
                                   <td>
                                    	<form:label  path="fechaNac">Edad:</form:label>
                                   </td>
                                   <td>
                                   		<input name="edad" value='<c:out value="${edad}"></c:out>' readonly="readonly" />
                                   </td>
                                </tr >
                                <tr>
                                   <td>
                                   		<form:label  path="colonia">Domicilio:</form:label>
                                   </td>
                                   <td>
                                   		<form:input  path="calle" readonly="true"/>
                                   </td>
                                   <td>
                                   		<form:input  path="numero" readonly="true"/>
                                   </td>
                                   <td>
                                   		<form:input  path="colonia" readonly="true"/>
                                   </td>
                                   <td>
                                   		<form:label  path="telefonoCasa">Teléfono:</form:label>
                                   </td>
                                   <td>
                                   		<form:input path="telefonoCasa" readonly="true"/>
                                   </td>
                                </tr>
                               </tbody>
                             </table> 
                       </td>
                    </tr> 
                    <tr>
                     	<td style="text-align:center;">
                     <table >               
                        <tbody>
                        <tr>
                         <td>
                           <strong>Signos vitales:</strong>
                         </td>
                       </tr>
                    </tbody>
                    </table> 
                    </td>
                    </tr> 
                    <tr>
                        <td style="text-align:center;">
                            <table >   
                              <tbody>
                                <tr>
                                <td style="text-align:left;">
                                <form:hidden path="reporteMedico.reporteMedicoId" />
                                <form:label path="reporteMedico.ta">T/A:</form:label>
                               </td>
                               <td style="text-align:left;">
                            	   <input  name="repMedA" id="repMedA" value='<c:out value="${repMedA}"></c:out>'  maxlength="5" size="3" onkeypress='return validateNum(event)'/> / <input name="repMedB" id="repMedB" value='<c:out value="${repMedB}"></c:out>'  maxlength="2" size="1"  onkeypress='return validateNum(event)'/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               </td>
                               
                               <td style="text-align:left;">
                                <form:label path="reporteMedico.resp" >RESP:</form:label>
                               </td>
                               <td style="text-align:left;"><form:input path="reporteMedico.resp"  maxlength="3" size="2" onkeypress='return validateNum(event)'/> x min &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                               <td style="text-align:left;">
                                 <form:label path="reporteMedico.pulso">PULSO:</form:label>
                               </td>
                               <td style="text-align:left;"><form:input path="reporteMedico.pulso"  maxlength="3" size="2" onkeypress='return validateNum(event)'/> x min &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                               </tr>
                                <tr>           
                               <td style="text-align:left;">
                                 <form:label path="reporteMedico.tem">TEM:</form:label>
                               </td>
                               <td style="text-align:left;"><form:input path="reporteMedico.tem"  maxlength="5" size="3" onkeypress='return validateNum(event)'/> ºC &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                               <td style="text-align:left;">
                                 <form:label path="reporteMedico.sao2">SaO2:</form:label>
                               </td>
                               <td style="text-align:left;"><form:input path="reporteMedico.sao2"  maxlength="3" size="2" onkeypress='return validateNum(event)'/> % &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                               <td style="text-align:left;">
                                 <form:label path="reporteMedico.peso">PESO:</form:label>
                               </td>
                               <td style="text-align:left;"><form:input path="reporteMedico.peso"  maxlength="3" size="2" onkeypress='return validateNum(event)'/> kg &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                </tr>
                               </tbody>
                            </table> 
                      </td>
                    </tr>
                                        <tr>
                        <td>
                            <table>   
                              <tbody>
                                <tr>
                                 <td>
                                    <form:label path="reporteMedico.grupoSanguineo">Grupo sanguíneo:</form:label>
                                 </td>
                               <td>
                                  <SELECT NAME="reporteMedico.grupoSanguineo"  >
                                  		<c:choose>
										      <c:when test = "${grupoSanguineoStr == 'A+'}">
										      	<OPTION VALUE="A+" selected="selected">A+</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="A+">A+</OPTION>
										      </c:otherwise>
										</c:choose>
										<c:choose>
										      <c:when test = "${grupoSanguineoStr == 'A-'}">
										      	<OPTION VALUE="A-" selected="selected">A-</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="A-">A-</OPTION>
										      </c:otherwise>
										</c:choose>
										<c:choose>
										      <c:when test = "${grupoSanguineoStr == 'B+'}">
										      	<OPTION VALUE="B+" selected="selected">B+</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="B+">B+</OPTION>
										      </c:otherwise>
										</c:choose>
                                        <c:choose>
										      <c:when test = "${grupoSanguineoStr == 'B-'}">
										      	<OPTION VALUE="B-" selected="selected">B-</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="B-">B-</OPTION>
										      </c:otherwise>
										</c:choose>  
                                        <c:choose>
										      <c:when test = "${grupoSanguineoStr == 'AB+'}">
										      	<OPTION VALUE="AB+" selected="selected">AB+</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="AB+">AB+</OPTION>
										      </c:otherwise>
										</c:choose>    
                                        <c:choose>
										      <c:when test = "${grupoSanguineoStr == 'AB-'}">
										      	<OPTION VALUE="AB-" selected="selected">AB-</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="AB-">AB-</OPTION>
										      </c:otherwise>
										</c:choose>  
                                        <c:choose>
										      <c:when test = "${grupoSanguineoStr == 'O+'}">
										      	<OPTION VALUE="O+" selected="selected">O+</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="O+">O+</OPTION>
										      </c:otherwise>
										</c:choose>    
										<c:choose>
										      <c:when test = "${grupoSanguineoStr == 'O-'}">
										      	<OPTION VALUE="O-" selected="selected">O-</OPTION>
										      </c:when>
										      <c:otherwise>
										      	<OPTION VALUE="O-">O-</OPTION>
										      </c:otherwise>
										</c:choose>
                                   </SELECT> 
                               </td>
                               <td>
                                <form:label path="reporteMedico.vacunacion">Vacunación:</form:label>
                               </td>
                               <td><form:input path="reporteMedico.vacunacion"  maxlength="15"/></td>
                               <td>
                               &nbsp;&nbsp;
                                 <form:label path="reporteMedico.tabaquismo">Tabaquismo:</form:label>
                               </td>
                               <td>
                               Si<form:radiobutton path="reporteMedico.tabaquismo" value="true"/> 
                               No<form:radiobutton path="reporteMedico.tabaquismo" value="false"/>
                               </td>
                               <td>&nbsp;&nbsp;&nbsp;
                                 <form:label path="reporteMedico.alcoholismo">Alcoholismo:</form:label>
                               </td>
                               <td>
                               Si<form:radiobutton path="reporteMedico.alcoholismo" value="true"/> 
                               No<form:radiobutton path="reporteMedico.alcoholismo" value="false"/>
                               </td>

                               </tr>
                               </tbody>
                            </table> 
                      </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <table>   
                              <tbody>
                                <tr>
                               <td>
                                 <form:label path="reporteMedico.actDesc">Actividades en descanso:</form:label>
                               </td>
                               <td><form:input path="reporteMedico.actDesc"  maxlength="15"/></td>
                                <td>
                                <form:label path="reporteMedico.actDep">Actividades deportivas y/o ejercicio:</form:label>
                               </td>
                               <td><form:input path="reporteMedico.actDep"  maxlength="15"/></td>
                                </tr>
                               </tbody>
                            </table> 
                      </td>
                    </tr>
                    
                    <tr>
                        <td valign="top">
                          <table>
                            <tr>
                            	<td width="50%" valign="top">
                                      <table class="hovertable">
                                           <tbody>
                                              <tr>
                                                   <th>
                                                Antecedentes Familiares
                                              </th>
                                              </tr>
                                              <tr>
                                                <td>
                                                   <table>
                                                    <tbody>
                                                         <tr>
                                                         <th></th><th>Si</th><th>No</th>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                     <form:label path="reporteMedico.antFamCancer">Cáncer</form:label>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamCancer" value="true"/>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamCancer" value="false"/>
                                                     </td>
                                                     </tr>
                                                     <tr>
                                                        <td>
                                                       <form:label path="reporteMedico.antFamCardio">Cardiovasculares</form:label>
                                                     </td>
                                                     <td>
                                                        <form:radiobutton path="reporteMedico.antFamCardio" value="true"/>
                                                     </td>
                                                     <td>
                                                        <form:radiobutton path="reporteMedico.antFamCardio" value="false"/>
                                                     </td>
                                                     </tr>
                                                     <tr>
                                                         <td>
                                                     <form:label path="reporteMedico.antFamDiabetes">Diabetes</form:label>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamDiabetes" value="true"/>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamDiabetes" value="false"/>
                                                     </td>
                                                     </tr>
                                                     <tr>
                                                        <td>
                                                     <form:label path="reporteMedico.antFamObesidad">Obesidad</form:label>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamObesidad" value="true"/>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamObesidad" value="false"/>
                                                     </td>
                                                     </tr>
                                                     <tr>
                                                        <td>
                                                     <form:label path="reporteMedico.antFamEpilepsia">Epilepsia</form:label>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamEpilepsia" value="true"/>
                                                     </td>
                                                     <td>
                                                      <form:radiobutton path="reporteMedico.antFamEpilepsia" value="false"/>
                                                     </td>
                                                     </tr>
                                                     <tr>
                                                       <td>
                                                       <form:label path="reporteMedico.antFamInmunologicas">Inmunológicas</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antFamInmunologicas" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antFamInmunologicas" value="false"/>
                                                       </td>
                                                    </tr>
                                                    
                                                    
                                                    
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamCrisisConvulsivas">Crisis Convulsivas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamCrisisConvulsivas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamCrisisConvulsivas" value="false"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamHipertensionArterial">Hipertensión Arterial</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamHipertensionArterial" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamHipertensionArterial" value="false"/>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamEndocripatias">Endocrinopatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamEndocripatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamEndocripatias" value="false"/>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamHemopatias">Hemopatías</form:label>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamHemopatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamHemopatias" value="false"/>
                                                        </td>
                                                    </tr>
												     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamNeuropatia">Neuropatías</form:label>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamNeuropatia" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamNeuropatia" value="false"/>
                                                        </td>
                                                    </tr>
    											     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamNefropatias">Nefropatías</form:label>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamNefropatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamNefropatias" value="false"/>
                                                        </td>
                                                    </tr>
	                                                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamFracturas">Fracturas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamFracturas" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamFracturas" value="false"/>
                                                        </td>
                                                    </tr>
	                                                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamEnfermMentales">Enferm. Mentales</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamEnfermMentales" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamEnfermMentales" value="false"/>
                                                        </td>
                                                    </tr>
			                                        <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamPsiquiatricas">Psiquiatras</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamPsiquiatricas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamPsiquiatricas" value="false"/>
                                                        </td>
                                                    </tr>
			                                        <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamEnfermExantemat">Enferm. Exantematicas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamEnfermExantemat" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamEnfermExantemat" value="false"/>
                                                        </td>
                                                    </tr>
					                                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamNeumopatias">Neumopatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamNeumopatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamNeumopatias" value="false"/>
                                                        </td>
                                                    </tr>
								                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamTransfusionales">Transfusionales</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamTransfusionales" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamTransfusionales" value="false"/>
                                                        </td>
                                                    </tr>
										            <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamHospitalizaciones">Hospitalizaciones</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamHospitalizaciones" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamHospitalizaciones" value="false"/>
                                                        </td>
                                                    </tr>
									                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antFamCirugias">Cirugías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antFamCirugias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antFamCirugias" value="false"/>
                                                        </td>
                                                    </tr> 
                                                    <tr>
                                                    	<td><form:label path="reporteMedico.antFamOtros">Otros</form:label></td>
                                                    	<td colspan="2"><form:input path="reporteMedico.antFamOtros"/></td>
                                                    </tr> 
                                                    <tr><td colspan="3">&nbsp;</td></tr>        
                                                  </tbody>
                                                 </table>
                                                 </td>
                                               </tr> 
                                            </tbody>
                                       </table>  
                                </td>
                                <td width="50%" valign="top">
                                      <table class="hovertable">
                                         <tbody>
                                         <tr>
                                             <th>
                                             Antecedentes Personales
                                          </th>
                                          </tr>
                                          <tr>
                                                <td>
                                               <table>
                                                  <tbody>
                                                    <tr>
                                                        <th></th><th>Si</th><th>No</th>
                                                    </tr>
                                                    <tr>
                                                       <td>
                                                       <form:label path="reporteMedico.antPersCancer">Cáncer</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersCancer" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersCancer" value="false"/>
                                                       </td>
                                                    </tr>
                                                    <tr>
                                                       <td>
                                                       <form:label path="reporteMedico.antPersCardio">Cardiovasculares</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersCardio" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersCardio" value="false"/>
                                                       </td>
                                                    </tr>
                                                    <tr>
                                                       <td>
                                                       <form:label path="reporteMedico.antPersDiabetes">Diabetes</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersDiabetes" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersDiabetes" value="false"/>
                                                       </td>
                                                    </tr>
                                                    <tr>
                                                       <td>
                                                       <form:label path="reporteMedico.antPersObesidad">Obesidad</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersObesidad" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersObesidad" value="false"/>
                                                       </td>
                                                    </tr>
                                                    <tr>
                                                       <td>
                                                        <form:label path="reporteMedico.antPersQuirurgicos">Quirúrgicos</form:label>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersQuirurgicos" value="true"/>
                                                       </td>
                                                       <td>
                                                        <form:radiobutton path="reporteMedico.antPersQuirurgicos" value="false"/>
                                                       </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersInmunologicas">Inmunológicas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersInmunologicas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersInmunologicas" value="false"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersAlergias">Alergias</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersAlergias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersAlergias" value="false"/>
                                                        </td>
                                                    </tr>
                                                    
                                                   <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersCrisisConvulsivas">Crisis Convulsivas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersCrisisConvulsivas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersCrisisConvulsivas" value="false"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersHipertensionArterial">Hipertensión Arterial</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersHipertensionArterial" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersHipertensionArterial" value="false"/>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersEndocripatias">Endocrinopatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersEndocripatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersEndocripatias" value="false"/>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersHemopatias">Hemopatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersHemopatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersHemopatias" value="false"/>
                                                        </td>
                                                    </tr>
												     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersNeuropatias">Neuropatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersNeuropatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersNeuropatias" value="false"/>
                                                        </td>
                                                    </tr>
    											     <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersNefropatias">Nefropatías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersNefropatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersNefropatias" value="false"/>
                                                        </td>
                                                    </tr>
													
                                                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersFracturas">Fracturas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersFracturas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersFracturas" value="false"/>
                                                        </td>
                                                    </tr>
	                                                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersEnfermMentales">Enferm. Mentales</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersEnfermMentales" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersEnfermMentales" value="false"/>
                                                        </td>
                                                    </tr>
			                                        <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersPsiquiatricas">Psiquiatras</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersPsiquiatricas" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersPsiquiatricas" value="false"/>
                                                        </td>
                                                    </tr>
			                                        <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersEnfermExantemat">Enferm. Exantematicas</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersEnfermExantemat" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersEnfermExantemat" value="false"/>
                                                        </td>
                                                    </tr>
					                                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersNeumopatias">Neumopatías</form:label>                                                       </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersNeumopatias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersNeumopatias" value="false"/>
                                                        </td>
                                                    </tr>
								                    <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersTransfusionales">Transfusionales</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersTransfusionales" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersTransfusionales" value="false"/>
                                                        </td>
                                                    </tr>
										            <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersHospitalizaciones">Hospitalizaciones</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersHospitalizaciones" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersHospitalizaciones" value="false"/>
                                                        </td>
                                                    </tr>
									                <tr>
                                                        <td>
                                                         <form:label path="reporteMedico.antPersCirugias">Cirugías</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.antPersCirugias" value="true"/>
                                                        </td>
                                                        <td>
                                                         <form:radiobutton path="reporteMedico.antPersCirugias" value="false"/>
                                                        </td>
                                                    </tr>
                                                    <tr> 
                                                    	<td><form:label path="reporteMedico.antPersOtros">Otros</form:label></td>
                                                    	<td colspan="2"><form:input path="reporteMedico.antPersOtros"/></td>
                                                    </tr>
                                                 </tbody>
                                               </table>
                                             </td>
                                           </tr> 
                                        </tbody>
                                      </table>  
                                </td>
                                </tr>
						  </table>
                        </td>
                    </tr>
                   
                    <tr>
                      <td>
                        <div style="vertical-align:central">
                          <table class="hovertable">
                                         <tbody>
                                           <tr>
                                              <th>
                                               Interrogatorio por Aparatos y Sistemas
                                              </th>
                                          </tr>
                                          <tr>
                                              <td>
                                                 <table>
                                                   <tbody>
                                                      <tr>
                                                          <th></th><th>Si</th><th>No</th>
                                                      </tr>
                                                     <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistLinfatico">Sistema Linfático</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistLinfatico" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistLinfatico" value="false"/>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistCardio">Sistema Cardiovascular</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistCardio" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistCardio" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistMuscEsquel">Sistema músculo esquelético</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistMuscEsquel" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistMuscEsquel" value="false"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistDigestivo">Aparato digestivo</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistDigestivo" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistDigestivo" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistUrinario">Sistema urinario</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistUrinario" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistUrinario" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistNervioso">Sistema nervioso</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistNervioso" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistNervioso" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistDermatologico">Dermatológico</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistDermatologico" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistDermatologico" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistInmunologico">Sistema inmunológico</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistInmunologico" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistInmunologico" value="false"/>
                                                        </td>
                                                    </tr>
                                                   <tr>
                                                        <td>
                                                          <form:label path="reporteMedico.interAparSistRespiratorio">Aparato respiratorio</form:label>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistRespiratorio" value="true"/>
                                                        </td>
                                                        <td>
                                                          <form:radiobutton path="reporteMedico.interAparSistRespiratorio" value="false"/>
                                                        </td>
                                                    </tr>
                                                   </tbody>
                                                 </table>
                                               </td>
                                          </tr>      
                             </table>
                          </div>
                       </td>
                    </tr>
                    

                    <tr>
                       <td>
                          <table>
                             <tr>
                                <td>
                                  <strong>Cicatrices:</strong>
                                </td>
                                <td>
                                   <form:input path="reporteMedico.cicatrices"  maxlength="44"/>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                  <strong>Padecimiento Actual:</strong>
                                </td>
                                <td>
                                   <textarea name="padecimientoActualStr" rows="3" cols="46"><c:out value="${padecimientoActualStr}" /></textarea>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                  <strong>Exploración física:</strong>
                                </td>
                                <td>
                                <textarea name="exploracionFisicaStr" rows="3" cols="46"><c:out value="${exploracionFisicaStr}" /></textarea>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                  <strong>Laboratorio o gabinete:</strong>
                                </td>
                                <td>
                                   <textarea name="laboratorioGabineteStr" rows="3" cols="46"><c:out value="${laboratorioGabineteStr}" /></textarea>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                  <strong>Tratamientos previos:</strong>
                                </td>
                                <td>
                                   <textarea name="tratamientosPreviosStr" rows="3" cols="46"><c:out value="${tratamientosPreviosStr}" /></textarea>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                   <strong>Diagnóstico</strong>
                                </td>                               
                                <td>
                                   <textarea name="diagnosticoStr" rows="3" cols="46"><c:out value="${diagnosticoStr}" /></textarea>
                                </td>
                             </tr>
                             <tr>
                                <td>
                                   <strong>Nota de evolución:</strong>   
                                </td>
                                <td>
                                   <textarea name="notaEvo" rows="3" cols="46"></textarea>
                                </td>
                             </tr >
                             <tr>
                             	<td colspan="2" width="100%">
                             	<c:if test="${not empty lists}">
                             		<table class="hovertable" style="width:100%;">
                                        <tr>
                                             <th>
                                             	Notas de evolución:
                                          	</th>
                                        </tr>
                                        <c:forEach items="${lists}" var="listValue">
                                        <tr>
                                          	<td>
                                          		${listValue}
                                          	</td>
                                        </tr>
                                        </c:forEach>
                                	</table>
                                 </c:if>         	
                             	</td>
                             </tr>
                          </table>
                       </td>
                    </tr >
                    <tr>
                       <td>
                          <table>
                             <tr>
                                <td>
                                   <input id="Guardar" name="Guardar" type="button" value="Guardar" onclick="javascript:guardarReporteMedico()"/>  
                                </td>
                                <td>
                                    <button type="button"  name="Regresar"  value="Regresar"  onclick="javascript:window.history.back()">Regresar</button>
                                  
                                </td>
                             </tr>
                          </table>
                       </td>
                    </tr>
                    
                 </tbody>
               </table> 
	               
               
			</form:form>
               
		  </div>
		</div>
		
<%@ include file="common/footer.jsp" %>
