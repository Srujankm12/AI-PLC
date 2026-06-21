<?xml version="1.0" encoding="utf-8"?>
<body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
 <LD>
  <inVariable localId="2" height="4" width="13" executionOrderId="1">
   <position x="16" y="20" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>R1Range</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="17" height="4" width="13" executionOrderId="1">
   <position x="16" y="48" />
   <connectionPointOut>
    <relPosition x="13" y="2" />
   </connectionPointOut>
   <expression>R2Range</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="31" height="4" width="8" executionOrderId="2">
   <position x="16" y="24" />
   <connectionPointOut>
    <relPosition x="8" y="2" />
   </connectionPointOut>
   <expression>R1Claw</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <inVariable localId="34" height="4" width="8" executionOrderId="2">
   <position x="16" y="52" />
   <connectionPointOut>
    <relPosition x="8" y="2" />
   </connectionPointOut>
   <expression>R2Claw</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </inVariable>
  <block localId="23" width="18" height="16" typeName="Robot.RobotFB" instanceName="Robot1" executionOrderId="3">
   <position x="31" y="16" />
   <inputVariables>
    <variable formalParameter="RobotRange">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="2">
       <position x="31" y="22" />
       <position x="29" y="22" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="AddArm">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="31">
       <position x="31" y="26" />
       <position x="24" y="26" />
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
    <variable formalParameter="RobotX">
     <connectionPointOut>
      <relPosition x="18" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="RobotY">
     <connectionPointOut>
      <relPosition x="18" y="10" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="RobotZ">
     <connectionPointOut>
      <relPosition x="18" y="14" />
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
      <parameterInformation formalParameter="RobotX" localId="18" executionOrderId="3" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="RobotY" localId="19" executionOrderId="3" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="RobotZ" localId="20" executionOrderId="3" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="RobotRange" localId="21" executionOrderId="3" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="AddArm" localId="22" executionOrderId="3" editorParameter="false" priority="5" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <block localId="33" width="18" height="16" typeName="Robot.RobotFB" instanceName="Robot2" executionOrderId="3">
   <position x="31" y="44" />
   <inputVariables>
    <variable formalParameter="RobotRange">
     <connectionPointIn>
      <relPosition x="0" y="6" />
      <connection refLocalId="17">
       <position x="31" y="50" />
       <position x="29" y="50" />
       <addData>
        <data name="connectionInformation" handleUnknown="preserve">
         <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
        </data>
       </addData>
      </connection>
     </connectionPointIn>
    </variable>
    <variable formalParameter="AddArm">
     <connectionPointIn>
      <relPosition x="0" y="10" />
      <connection refLocalId="34">
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
   </inputVariables>
   <inOutVariables />
   <outputVariables>
    <variable formalParameter="RobotX">
     <connectionPointOut>
      <relPosition x="18" y="6" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="RobotY">
     <connectionPointOut>
      <relPosition x="18" y="10" />
     </connectionPointOut>
    </variable>
    <variable formalParameter="RobotZ">
     <connectionPointOut>
      <relPosition x="18" y="14" />
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
      <parameterInformation formalParameter="RobotX" localId="24" executionOrderId="3" editorParameter="false" priority="1" />
      <parameterInformation formalParameter="RobotY" localId="25" executionOrderId="3" editorParameter="false" priority="2" />
      <parameterInformation formalParameter="RobotZ" localId="29" executionOrderId="3" editorParameter="false" priority="3" />
      <parameterInformation formalParameter="RobotRange" localId="30" executionOrderId="3" editorParameter="false" priority="4" />
      <parameterInformation formalParameter="AddArm" localId="32" executionOrderId="3" editorParameter="false" priority="5" />
     </parameterInformations>
    </data>
   </addData>
  </block>
  <outVariable localId="1" height="4" width="8" executionOrderId="4">
   <position x="56" y="20" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="23" formalParameter="RobotX">
     <position x="56" y="22" />
     <position x="49" y="22" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R1X</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="26" height="4" width="8" executionOrderId="4">
   <position x="56" y="48" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="33" formalParameter="RobotX">
     <position x="56" y="50" />
     <position x="49" y="50" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R2X</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="10" height="4" width="8" executionOrderId="5">
   <position x="56" y="24" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="23" formalParameter="RobotY">
     <position x="56" y="26" />
     <position x="49" y="26" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R1Y</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="27" height="4" width="8" executionOrderId="5">
   <position x="56" y="52" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="33" formalParameter="RobotY">
     <position x="56" y="54" />
     <position x="49" y="54" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R2Y</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="2" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="11" height="4" width="8" executionOrderId="6">
   <position x="56" y="28" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="23" formalParameter="RobotZ">
     <position x="56" y="30" />
     <position x="49" y="30" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R1Z</expression>
   <addData>
    <data name="objectInformation" handleUnknown="preserve">
     <objectInformation networkId="1" subNetworkId="0" />
    </data>
   </addData>
  </outVariable>
  <outVariable localId="28" height="4" width="8" executionOrderId="6">
   <position x="56" y="56" />
   <connectionPointIn>
    <relPosition x="0" y="2" />
    <connection refLocalId="33" formalParameter="RobotZ">
     <position x="56" y="58" />
     <position x="49" y="58" />
     <addData>
      <data name="connectionInformation" handleUnknown="preserve">
       <connectionInformation useAutoConnector="false" useUserConnector="false" implicitMultiRouted="false" invisible="false" wasExplicitFeedback="false" />
      </data>
     </addData>
    </connection>
   </connectionPointIn>
   <expression>R2Z</expression>
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
    <version>2.0.7.3.1679:A1.9</version>
    <multilineOptions maximumContactWidth="18" minimumContactWidth="18" maximumContactLines="7" contactEllipse="true" maximumInstanceNameWidth="32" maximumInstanceNameLines="5" instanceNameEllipse="true" maximumVariableWidth="2147483647" variableEllipse="false" />
   </docInformation>
  </data>
 </addData>
</body>