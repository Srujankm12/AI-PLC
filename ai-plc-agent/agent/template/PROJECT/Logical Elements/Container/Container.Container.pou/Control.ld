<?xml version="1.0" encoding="utf-8"?>
<body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
 <LD>
  <inVariable localId="6" height="4" width="18" executionOrderId="1">
   <position x="11" y="12" />
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
  <inVariable localId="36" height="4" width="13" executionOrderId="1">
   <position x="16" y="76" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>Intake</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="66" height="4" width="23" executionOrderId="1">
   <position x="11" y="112" />
   <connectionPointOut>
    <relPosition x="23" y="2" />
   </connectionPointOut>
   <expression>ContainerLevelMonitoring</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="71" height="4" width="18" executionOrderId="1">
   <position x="11" y="148" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="5" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="76" height="4" width="13" executionOrderId="1">
   <position x="11" y="176" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="6" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="7" height="4" width="18" executionOrderId="2">
   <position x="11" y="16" />
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
  <inVariable localId="26" height="4" width="18" executionOrderId="2">
   <position x="11" y="152" />
   <connectionPointOut>
    <relPosition x="18" y="2" />
   </connectionPointOut>
   <expression>TemperatureMinimum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="5" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="37" height="4" width="13" executionOrderId="2">
   <position x="16" y="80" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>Heater</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="68" height="4" width="13" executionOrderId="2">
   <position x="21" y="116" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>ContainerStates</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="78" height="4" width="13" executionOrderId="2">
   <position x="11" y="180" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelMinimum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="6" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="8" height="4" width="18" executionOrderId="3">
   <position x="11" y="20" />
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
  <block localId="23" width="13" height="12" typeName="MinMaxCheck" instanceName="TempCheck" executionOrderId="3">
   <position x="46" y="144" />
   <inputVariables>
    <variable formalParameter="MinVal">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="26">
       <position x="46" y="154" />
       <position x="29" y="154" />
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
    <variable formalParameter="MaxVal">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="71">
       <position x="46" y="150" />
       <position x="29" y="150" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
     <connectionPointOut>
      <relPosition x="13" y="6" />
     </connectionPointOut>
    </variable>
   </inOutVariables>
   <outputVariables />
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="5" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="MaxVal" localId="25" executionOrderId="3" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="MinVal" localId="24" executionOrderId="3" editorParameter="false" priority="2" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="38" height="4" width="13" executionOrderId="3">
   <position x="16" y="84" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>Drain</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="69" height="4" width="13" executionOrderId="3">
   <position x="21" y="120" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelCurrent</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="73" width="13" height="12" typeName="MinMaxCheck" instanceName="LevelCheck" executionOrderId="3">
   <position x="46" y="172" />
   <inputVariables>
    <variable formalParameter="MinVal">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="78">
       <position x="46" y="182" />
       <position x="24" y="182" />
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
    <variable formalParameter="MaxVal">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="76">
       <position x="46" y="178" />
       <position x="24" y="178" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
     <connectionPointOut>
      <relPosition x="13" y="6" />
     </connectionPointOut>
    </variable>
   </inOutVariables>
   <outputVariables />
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="6" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="MaxVal" localId="75" executionOrderId="3" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="MinVal" localId="74" executionOrderId="3" editorParameter="false" priority="2" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="39" height="4" width="13" executionOrderId="4">
   <position x="16" y="88" />
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
  <block localId="47" width="18" height="16" typeName="General.TLC" instanceName="TLCTemperature" executionOrderId="4">
   <position x="41" y="8" />
   <inputVariables>
    <variable formalParameter="ActualValue">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="6">
       <position x="41" y="14" />
       <position x="29" y="14" />
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
      <connection refLocalId="7">
       <position x="41" y="18" />
       <position x="29" y="18" />
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
      <connection refLocalId="8">
       <position x="41" y="22" />
       <position x="29" y="22" />
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
      <parameterInformation formalParameter="ActualValue" localId="43" executionOrderId="4" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Minimum" localId="44" executionOrderId="4" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Maximum" localId="45" executionOrderId="4" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="Switch" localId="46" executionOrderId="4" negatable="true" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="70" height="4" width="13" executionOrderId="4">
   <position x="21" y="124" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>LevelMinimum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <outVariable localId="72" height="4" width="18" executionOrderId="4">
   <position x="111" y="148" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="23" formalParameter="MaxVal">
     <position x="111" y="150" />
     <position x="59" y="150" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>TemperatureMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="5" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="77" height="4" width="13" executionOrderId="4">
   <position x="116" y="176" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="73" formalParameter="MaxVal">
     <position x="116" y="178" />
     <position x="59" y="178" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>LevelMaximum</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="6" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="21" height="4" width="13" executionOrderId="5">
   <position x="116" y="12" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="47" formalParameter="Switch">
     <position x="116" y="14" />
     <position x="59" y="14" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>Heater</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <inVariable localId="40" height="4" width="18" executionOrderId="5">
   <position x="11" y="92" />
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
  <block localId="61" width="18" height="20" typeName="ContainerLevelMonitor" instanceName="ContainerLevelMonitor_1" executionOrderId="5">
   <position x="46" y="108" />
   <inputVariables>
    <variable formalParameter="ContainerStates">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="68">
       <position x="46" y="118" />
       <position x="34" y="118" />
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
      <relPosition x="0" y="14" />
      <connection refLocalId="69">
       <position x="46" y="122" />
       <position x="34" y="122" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="MinimumLevel">
     <connectionPointIn>
      <relPosition x="0" y="18" />
      <connection refLocalId="70">
       <position x="46" y="126" />
       <position x="34" y="126" />
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
    <variable formalParameter="ContainerLevelMonitoring">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="66">
       <position x="46" y="114" />
       <position x="34" y="114" />
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
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="ContainerLevelMonitoring" localId="65" executionOrderId="5" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="ContainerStates" localId="62" executionOrderId="5" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="ContainerLevel" localId="63" executionOrderId="5" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="MinimumLevel" localId="64" executionOrderId="5" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <inVariable localId="14" height="4" width="13" executionOrderId="6">
   <position x="16" y="44" />
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
  <block localId="28" width="33" height="24" typeName="ContainerTextGeneration" instanceName="ContainerTextGeneration_1" executionOrderId="6">
   <position x="46" y="72" />
   <inputVariables>
    <variable formalParameter="Intake">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="36">
       <position x="46" y="78" />
       <position x="29" y="78" />
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
      <relPosition x="0" y="10" />
      <connection refLocalId="37">
       <position x="46" y="82" />
       <position x="29" y="82" />
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
      <relPosition x="0" y="14" />
      <connection refLocalId="38">
       <position x="46" y="86" />
       <position x="29" y="86" />
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
      <relPosition x="0" y="18" />
      <connection refLocalId="39">
       <position x="46" y="90" />
       <position x="29" y="90" />
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
      <relPosition x="0" y="22" />
      <connection refLocalId="40">
       <position x="46" y="94" />
       <position x="29" y="94" />
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
    <variable formalParameter="ContainerStatus">
     <connectionPointOut>
      <relPosition x="33" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="ContainerValue">
     <connectionPointOut>
      <relPosition x="33" y="10" />
     </connectionPointOut>
    </variable>
   </outputVariables>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
    <data name="blockInformation" handleUnknown="preserve">
     <blockInformation canEditLabel="true" extensible="false" imageWidth="8" imageHeight="0" />
    </data>
    <data name="parameterInformations" handleUnknown="preserve">
     <parameterInformations>
      <parameterInformation formalParameter="Intake" localId="29" executionOrderId="6" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="ContainerStatus" localId="34" executionOrderId="6" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Heater" localId="30" executionOrderId="6" negatable="true" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="ContainerValue" localId="35" executionOrderId="6" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="Drain" localId="31" executionOrderId="6" negatable="true" editorParameter="false" priority="5" />
      <parameterInformation formalParameter="ContainerLevel" localId="32" executionOrderId="6" editorParameter="false" priority="6" />
      <parameterInformation formalParameter="ContainerTemperature" localId="33" executionOrderId="6" editorParameter="false" priority="7" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="67" height="4" width="23" executionOrderId="6">
   <position x="106" y="112" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="61" formalParameter="ContainerLevelMonitoring">
     <position x="106" y="114" />
     <position x="64" y="114" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>ContainerLevelMonitoring</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="4" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <inVariable localId="15" height="4" width="13" executionOrderId="7">
   <position x="16" y="48" />
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
  <outVariable localId="41" height="4" width="13" executionOrderId="7">
   <position x="116" y="76" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="28" formalParameter="ContainerStatus">
     <position x="116" y="78" />
     <position x="79" y="78" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>ContainerStatus</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <inVariable localId="16" height="4" width="13" executionOrderId="8">
   <position x="16" y="52" />
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
  <outVariable localId="42" height="4" width="13" executionOrderId="8">
   <position x="116" y="80" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="28" formalParameter="ContainerValue">
     <position x="116" y="82" />
     <position x="79" y="82" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>ContainerValues</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <block localId="52" width="18" height="16" typeName="General.TLC" instanceName="TLCLevel" executionOrderId="9">
   <position x="41" y="40" />
   <inputVariables>
    <variable formalParameter="ActualValue">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="14">
       <position x="41" y="46" />
       <position x="29" y="46" />
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
      <connection refLocalId="15">
       <position x="41" y="50" />
       <position x="29" y="50" />
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
      <connection refLocalId="16">
       <position x="41" y="54" />
       <position x="29" y="54" />
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
      <parameterInformation formalParameter="ActualValue" localId="48" executionOrderId="9" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Minimum" localId="49" executionOrderId="9" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Maximum" localId="50" executionOrderId="9" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="Switch" localId="51" executionOrderId="9" negatable="true" editorParameter="false" priority="4" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="17" width="13" height="12" typeName="DrainCheck" instanceName="DrainCheck_1" executionOrderId="10">
   <position x="81" y="24" />
   <inputVariables>
    <variable formalParameter="Intake">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="47" formalParameter="Switch">
       <position x="81" y="30" />
       <position x="79" y="30" />
       <position x="79" y="14" />
       <position x="59" y="14" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="Heating">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="52" formalParameter="Switch">
       <position x="81" y="34" />
       <position x="79" y="34" />
       <position x="79" y="46" />
       <position x="59" y="46" />
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
    <variable formalParameter="Drain">
     <connectionPointOut>
      <relPosition x="13" y="6" />
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
      <parameterInformation formalParameter="Intake" localId="18" executionOrderId="10" negatable="true" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="Drain" localId="20" executionOrderId="10" negatable="true" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="Heating" localId="19" executionOrderId="10" negatable="true" editorParameter="false" priority="3" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="27" height="4" width="13" executionOrderId="11">
   <position x="116" y="28" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="17" formalParameter="Drain">
     <position x="116" y="30" />
     <position x="94" y="30" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>Drain</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="22" height="4" width="13" executionOrderId="12">
   <position x="116" y="44" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="52" formalParameter="Switch">
     <position x="116" y="46" />
     <position x="59" y="46" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>Intake</expression>
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