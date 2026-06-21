<?xml version="1.0" encoding="utf-8"?>
<body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
 <LD>
  <inVariable localId="1" height="4" width="13" executionOrderId="1">
   <position x="11" y="60" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerTrends</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="9" height="4" width="13" executionOrderId="1">
   <position x="11" y="12" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerStates</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="2" height="4" width="13" executionOrderId="2">
   <position x="11" y="64" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="10" height="4" width="8" executionOrderId="2">
   <position x="11" y="16" />
   <connectionPointOut>
    <relPosition x="8" y="2" />
   </connectionPointOut>
   <expression>Intake</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="3" height="4" width="18" executionOrderId="3">
   <position x="11" y="68" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="11" height="4" width="8" executionOrderId="3">
   <position x="11" y="20" />
   <connectionPointOut>
    <relPosition x="8" y="2" />
   </connectionPointOut>
   <expression>Heater</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="12" height="4" width="8" executionOrderId="4">
   <position x="11" y="24" />
   <connectionPointOut>
    <relPosition x="8" y="2" />
   </connectionPointOut>
   <expression>Drain</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="39" width="18" height="16" typeName="Container.ContainerTrend" instanceName="ContainerTrend_1" executionOrderId="4">
   <position x="46" y="56" />
   <inputVariables>
    <variable formalParameter="ContainerLevel">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="2">
       <position x="46" y="66" />
       <position x="24" y="66" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="ContainerTemperature">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="3">
       <position x="46" y="70" />
       <position x="29" y="70" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables>
    <variable formalParameter="ContainerTrends">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="1">
       <position x="46" y="62" />
       <position x="24" y="62" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
     <connectionPointOut>
      <relPosition x="18" y="6" />
     </connectionPointOut>
    </variable>
   </inOutVariables>
   <outputVariables />
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ContainerTrends" localId="36" executionOrderId="4" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="ContainerLevel" localId="37" executionOrderId="4" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="ContainerTemperature" localId="38" executionOrderId="4" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="8" height="4" width="13" executionOrderId="5">
   <position x="116" y="60" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="39" formalParameter="ContainerTrends">
     <position x="116" y="62" />
     <position x="64" y="62" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>ContainerTrends</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <inVariable localId="13" height="4" width="13" executionOrderId="5">
   <position x="11" y="28" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="14" height="4" width="18" executionOrderId="6">
   <position x="11" y="32" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="15" height="4" width="13" executionOrderId="7">
   <position x="11" y="36" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerStatus</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="16" height="4" width="13" executionOrderId="8">
   <position x="11" y="40" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerValues</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="35" width="23" height="36" typeName="Container.ContainerStructDataCollector" instanceName="ContainerStructDataCollector_1" executionOrderId="9">
   <position x="41" y="8" />
   <inputVariables>
    <variable formalParameter="Intake">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="10">
       <position x="41" y="18" />
       <position x="19" y="18" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Heater">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="11">
       <position x="41" y="22" />
       <position x="19" y="22" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Drain">
     <connectionPointIn>
      <relPosition x="0" y="18" />
      <connection refLocalId="12">
       <position x="41" y="26" />
       <position x="19" y="26" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="ContainerLevel">
     <connectionPointIn>
      <relPosition x="0" y="22" />
      <connection refLocalId="13">
       <position x="41" y="30" />
       <position x="24" y="30" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="ContainerTemperature">
     <connectionPointIn>
      <relPosition x="0" y="26" />
      <connection refLocalId="14">
       <position x="41" y="34" />
       <position x="29" y="34" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="ContainerStatus">
     <connectionPointIn>
      <relPosition x="0" y="30" />
      <connection refLocalId="15">
       <position x="41" y="38" />
       <position x="24" y="38" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="ContainerValue">
     <connectionPointIn>
      <relPosition x="0" y="34" />
      <connection refLocalId="16">
       <position x="41" y="42" />
       <position x="24" y="42" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables>
    <variable formalParameter="ContainerStates">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="9">
       <position x="41" y="14" />
       <position x="24" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
     <connectionPointOut>
      <relPosition x="23" y="6" />
     </connectionPointOut>
    </variable>
   </inOutVariables>
   <outputVariables />
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ContainerStates" localId="27" executionOrderId="9" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Intake" localId="28" executionOrderId="9" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Heater" localId="29" executionOrderId="9" negatable="true" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="Drain" localId="30" executionOrderId="9" negatable="true" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="ContainerLevel" localId="31" executionOrderId="9" editorParameter="false" priority="5" />
      <parameterInformation formalParameter="ContainerTemperature" localId="32" executionOrderId="9" editorParameter="false" priority="6" />
      <parameterInformation formalParameter="ContainerStatus" localId="33" executionOrderId="9" editorParameter="false" priority="7" />
      <parameterInformation formalParameter="ContainerValue" localId="34" executionOrderId="9" editorParameter="false" priority="8" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="26" height="4" width="13" executionOrderId="10">
   <position x="111" y="12" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="35" formalParameter="ContainerStates">
     <position x="111" y="14" />
     <position x="64" y="14" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>ContainerStates</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
 </LD>
 <addData>
  <data name="docInformation" handleUnknown="preserve">
   <docInformation gridActive="true" pageWidth="-1">
    <version>2.999.999.999.999:A1.9</version>
    <multilineOptions maximumContactWidth="18" minimumContactWidth="18" maximumContactLines="7" contactEllipse="true" maximumInstanceNameWidth="32" maximumInstanceNameLines="5" instanceNameEllipse="true" maximumVariableWidth="2147483647" variableEllipse="false" />
   </docInformation>
  </data>
 </addData>
</body>