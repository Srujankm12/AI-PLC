<?xml version="1.0" encoding="utf-8"?>
<body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
 <LD>
  <comment localId="11" height="4" width="20">
   <position x="10" y="4" />
   <content>
    <html xmlns="http://www.w3.org/1999/xhtml">
     <head xmlns="">
      <title />
     </head>
     <body xmlns="">
      <p style="color:#FFFFFF;font-family:Arial;font-weight:normal;font-style:normal;font-size:11.00pt;">Container Simulation</p>
     </body>
    </html>
   </content>
   <addData>
    <data name="commentInformation" handleUnknown="preserve">
     <commentInformation autoSize="true" parentMainId="0" parentSubId="0" parentBaseType="None" executionOrderId="0" isJumpLabel="false" />
    </data>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </comment>
  <inVariable localId="6" height="4" width="13" executionOrderId="1">
   <position x="11" y="12" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerStart</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="14" width="28" height="12" typeName="ContainerEnvironment" instanceName="ContainerEnvironment_1" executionOrderId="2">
   <position x="26" y="8" />
   <inputVariables>
    <variable formalParameter="ContainerStart">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="6">
       <position x="26" y="14" />
       <position x="24" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="ContainerPulse">
     <connectionPointOut>
      <relPosition x="28" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="ContainerFastPulse">
     <connectionPointOut>
      <relPosition x="28" y="10" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ContainerStart" localId="10" executionOrderId="2" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="ContainerPulse" localId="12" executionOrderId="2" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="ContainerFastPulse" localId="13" executionOrderId="2" negatable="true" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="9" height="4" width="18" executionOrderId="3">
   <position x="11" y="24" />
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
  <inVariable localId="8" height="4" width="18" executionOrderId="4">
   <position x="11" y="28" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureMinimum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="44" height="4" width="13" executionOrderId="5">
   <position x="81" y="28" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ResetCounter</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="7" height="4" width="18" executionOrderId="6">
   <position x="11" y="32" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="19" width="18" height="16" typeName="General.TLC" instanceName="TLC_2" executionOrderId="7">
   <position x="31" y="20" />
   <inputVariables>
    <variable formalParameter="ActualValue">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="9">
       <position x="31" y="26" />
       <position x="29" y="26" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Minimum">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="8">
       <position x="31" y="30" />
       <position x="29" y="30" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Maximum">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="7">
       <position x="31" y="34" />
       <position x="29" y="34" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="Switch">
     <connectionPointOut>
      <relPosition x="18" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ActualValue" localId="15" executionOrderId="7" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Minimum" localId="16" executionOrderId="7" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Maximum" localId="17" executionOrderId="7" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="Switch" localId="18" executionOrderId="7" negatable="true" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="39" width="8" height="12" typeName="AND" executionOrderId="8">
   <position x="71" y="8" />
   <inputVariables>
    <variable formalParameter="IN1" negated="true" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="14" formalParameter="ContainerPulse">
       <position x="71" y="14" />
       <position x="54" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="IN2" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="19" formalParameter="Switch">
       <position x="71" y="18" />
       <position x="70" y="18" />
       <position x="70" y="17" />
       <position x="67" y="17" />
       <position x="67" y="26" />
       <position x="49" y="26" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="AND" hidden="true">
     <connectionPointOut>
      <relPosition x="8" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="false" extensible="true" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="IN1" localId="40" executionOrderId="8" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="AND" localId="42" executionOrderId="8" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="IN2" localId="41" executionOrderId="8" negatable="true" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="34" width="8" height="12" typeName="AND" executionOrderId="9">
   <position x="71" y="20" />
   <inputVariables>
    <variable formalParameter="IN1" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="14" formalParameter="ContainerPulse">
       <position x="71" y="26" />
       <position x="69" y="26" />
       <position x="69" y="14" />
       <position x="54" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="IN2" negated="true" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="19" formalParameter="Switch">
       <position x="71" y="30" />
       <position x="67" y="30" />
       <position x="67" y="26" />
       <position x="49" y="26" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="AND" hidden="true">
     <connectionPointOut>
      <relPosition x="8" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="false" extensible="true" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="IN1" localId="35" executionOrderId="9" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="AND" localId="37" executionOrderId="9" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="IN2" localId="36" executionOrderId="9" negatable="true" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="43" height="4" width="13" executionOrderId="10">
   <position x="81" y="32" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LoadCounter</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="55" width="13" height="24" typeName="CTUD" instanceName="CTUD_2" executionOrderId="11">
   <position x="96" y="16" />
   <inputVariables>
    <variable formalParameter="CU">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="39" formalParameter="AND">
       <position x="96" y="22" />
       <position x="94" y="22" />
       <position x="94" y="14" />
       <position x="79" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="CD">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="34" formalParameter="AND">
       <position x="96" y="26" />
       <position x="79" y="26" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="RESET">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="44">
       <position x="96" y="30" />
       <position x="94" y="30" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="LOAD">
     <connectionPointIn>
      <relPosition x="0" y="18" />
      <connection refLocalId="43">
       <position x="96" y="34" />
       <position x="94" y="34" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="PV">
     <connectionPointIn>
      <relPosition x="0" y="22" />
      <connection refLocalId="7">
       <position x="96" y="38" />
       <position x="30" y="38" />
       <position x="30" y="34" />
       <position x="29" y="34" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="QU">
     <connectionPointOut>
      <relPosition x="13" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="QD">
     <connectionPointOut>
      <relPosition x="13" y="10" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="CV">
     <connectionPointOut>
      <relPosition x="13" y="14" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="CU" localId="56" executionOrderId="11" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="QU" localId="61" executionOrderId="11" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="CD" localId="57" executionOrderId="11" negatable="true" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="QD" localId="62" executionOrderId="11" negatable="true" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="RESET" localId="58" executionOrderId="11" negatable="true" editorParameter="false" priority="5" />
      <parameterInformation formalParameter="CV" localId="63" executionOrderId="11" editorParameter="false" priority="6" />
      <parameterInformation formalParameter="LOAD" localId="59" executionOrderId="11" negatable="true" editorParameter="false" priority="7" />
      <parameterInformation formalParameter="PV" localId="60" executionOrderId="11" editorParameter="false" priority="8" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="1" height="4" width="18" executionOrderId="12">
   <position x="131" y="20" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="55" formalParameter="QU">
     <position x="131" y="22" />
     <position x="109" y="22" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>CountTemperatureUp</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="71" height="4" width="18" executionOrderId="13">
   <position x="131" y="24" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="55" formalParameter="QD">
     <position x="131" y="26" />
     <position x="109" y="26" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>CountTemperatureDown</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="72" height="4" width="18" executionOrderId="14">
   <position x="131" y="28" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="55" formalParameter="CV">
     <position x="131" y="30" />
     <position x="109" y="30" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>TemperatureCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <inVariable localId="5" height="4" width="13" executionOrderId="15">
   <position x="11" y="52" />
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
  <inVariable localId="4" height="4" width="13" executionOrderId="16">
   <position x="11" y="56" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelMinimum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="38" height="4" width="13" executionOrderId="17">
   <position x="81" y="56" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ResetCounter</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="3" height="4" width="13" executionOrderId="18">
   <position x="11" y="60" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="54" width="18" height="16" typeName="General.TLC" instanceName="TLC_1" executionOrderId="19">
   <position x="31" y="48" />
   <inputVariables>
    <variable formalParameter="ActualValue">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="5">
       <position x="31" y="54" />
       <position x="24" y="54" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Minimum">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="4">
       <position x="31" y="58" />
       <position x="24" y="58" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Maximum">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="3">
       <position x="31" y="62" />
       <position x="24" y="62" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="Switch">
     <connectionPointOut>
      <relPosition x="18" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ActualValue" localId="20" executionOrderId="19" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Minimum" localId="21" executionOrderId="19" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Maximum" localId="22" executionOrderId="19" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="Switch" localId="23" executionOrderId="19" negatable="true" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="29" width="8" height="12" typeName="AND" executionOrderId="20">
   <position x="71" y="44" />
   <inputVariables>
    <variable formalParameter="IN1" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="14" formalParameter="ContainerFastPulse">
       <position x="71" y="50" />
       <position x="68" y="50" />
       <position x="68" y="18" />
       <position x="54" y="18" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="IN2" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="54" formalParameter="Switch">
       <position x="71" y="54" />
       <position x="49" y="54" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="AND" hidden="true">
     <connectionPointOut>
      <relPosition x="8" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="false" extensible="true" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="IN1" localId="30" executionOrderId="20" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="AND" localId="32" executionOrderId="20" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="IN2" localId="31" executionOrderId="20" negatable="true" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="33" height="4" width="13" executionOrderId="21">
   <position x="81" y="60" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LoadCounter</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="2" height="4" width="13" executionOrderId="22">
   <position x="11" y="68" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>Drain</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="24" width="8" height="16" typeName="AND" executionOrderId="23">
   <position x="71" y="56" />
   <inputVariables>
    <variable formalParameter="IN1" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="14" formalParameter="ContainerFastPulse">
       <position x="71" y="62" />
       <position x="68" y="62" />
       <position x="68" y="18" />
       <position x="54" y="18" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="IN2" negated="true" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="54" formalParameter="Switch">
       <position x="71" y="66" />
       <position x="67" y="66" />
       <position x="67" y="54" />
       <position x="49" y="54" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="In3" hidden="true">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="2">
       <position x="71" y="70" />
       <position x="24" y="70" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="AND" hidden="true">
     <connectionPointOut>
      <relPosition x="8" y="6" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="false" extensible="true" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="IN1" localId="25" executionOrderId="23" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="AND" localId="28" executionOrderId="23" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="IN2" localId="26" executionOrderId="23" negatable="true" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="In3" localId="27" executionOrderId="23" negatable="true" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="45" width="13" height="24" typeName="CTUD" instanceName="CTUD_1" executionOrderId="24">
   <position x="96" y="44" />
   <inputVariables>
    <variable formalParameter="CU">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="29" formalParameter="AND">
       <position x="96" y="50" />
       <position x="79" y="50" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="CD">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="24" formalParameter="AND">
       <position x="96" y="54" />
       <position x="80" y="54" />
       <position x="80" y="62" />
       <position x="79" y="62" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="RESET">
     <connectionPointIn>
      <relPosition x="0" y="14" />
      <connection refLocalId="38">
       <position x="96" y="58" />
       <position x="94" y="58" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="LOAD">
     <connectionPointIn>
      <relPosition x="0" y="18" />
      <connection refLocalId="33">
       <position x="96" y="62" />
       <position x="94" y="62" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="PV">
     <connectionPointIn>
      <relPosition x="0" y="22" />
      <connection refLocalId="3">
       <position x="96" y="66" />
       <position x="81" y="66" />
       <position x="81" y="73" />
       <position x="29" y="73" />
       <position x="29" y="62" />
       <position x="24" y="62" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="QU">
     <connectionPointOut>
      <relPosition x="13" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="QD">
     <connectionPointOut>
      <relPosition x="13" y="10" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="CV">
     <connectionPointOut>
      <relPosition x="13" y="14" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="CU" localId="46" executionOrderId="24" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="QU" localId="51" executionOrderId="24" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="CD" localId="47" executionOrderId="24" negatable="true" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="QD" localId="52" executionOrderId="24" negatable="true" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="RESET" localId="48" executionOrderId="24" negatable="true" editorParameter="false" priority="5" />
      <parameterInformation formalParameter="CV" localId="53" executionOrderId="24" editorParameter="false" priority="6" />
      <parameterInformation formalParameter="LOAD" localId="49" executionOrderId="24" negatable="true" editorParameter="false" priority="7" />
      <parameterInformation formalParameter="PV" localId="50" executionOrderId="24" editorParameter="false" priority="8" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="70" height="4" width="13" executionOrderId="25">
   <position x="136" y="48" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="45" formalParameter="QU">
     <position x="136" y="50" />
     <position x="109" y="50" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>CountLevelUp</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="69" height="4" width="13" executionOrderId="26">
   <position x="136" y="52" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="45" formalParameter="QD">
     <position x="136" y="54" />
     <position x="109" y="54" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>CountLevelDown</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="68" height="4" width="13" executionOrderId="27">
   <position x="136" y="56" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="45" formalParameter="CV">
     <position x="136" y="58" />
     <position x="109" y="58" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>LevelCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
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