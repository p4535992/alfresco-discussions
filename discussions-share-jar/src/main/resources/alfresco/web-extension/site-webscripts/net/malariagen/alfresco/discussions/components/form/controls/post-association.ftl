<#include "/org/alfresco/components/form/controls/common/picker.inc.ftl" />

<#assign controlId = fieldHtmlId + "-cntrl">

<script type="text/javascript">//<![CDATA[
(function()
{
   <@renderPickerJS field "picker" />
   picker.setOptions(
   {
   <#if field.control.params.showTargetLink??>
      showLinkToTarget: ${field.control.params.showTargetLink},
      
      targetLinkTemplate: function (item) { 
      		var url = Alfresco.constants.URL_PAGECONTEXT 
      		if (item.site) {
      			url += "site/"+ item.site + "/";
      		} 
      		url += "discussions-topicview?topicId=" + item.name;
      		item.name = item.title; 
      		return url;
      	},
   </#if>
   <#if field.control.params.allowNavigationToContentChildren??>
      allowNavigationToContentChildren: ${field.control.params.allowNavigationToContentChildren},
   </#if>
      itemType: "${field.endpointType}",
      multipleSelectMode: ${field.endpointMany?string},
      parentNodeRef: "alfresco://company/home",
   <#if field.control.params.rootNode??>
      rootNode: "${field.control.params.rootNode}",
   </#if>
      itemFamily: "node",
      displayMode: "${field.control.params.displayMode!"items"}"
   });
})();
//]]></script>

<div class="form-field">
   <#if form.mode == "view">
      <div id="${controlId}" class="viewmode-field">
         <#if (field.endpointMandatory!false || field.mandatory!false) && field.value == "">
            <span class="incomplete-warning"><img src="${url.context}/res/components/form/images/warning-16.png" title="${msg("form.field.incomplete")}" /><span>
         </#if>
         <span class="viewmode-label">${field.label?html}:</span>
         <span id="${controlId}-currentValueDisplay" class="viewmode-value current-values"></span>
      </div>
   <#else>
      <label for="${controlId}">${field.label?html}:<#if field.endpointMandatory!false || field.mandatory!false><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>

      <div id="${controlId}" class="object-finder">

         <div id="${controlId}-currentValueDisplay" class="current-values"></div>

         <#if field.disabled == false>
            <input type="hidden" id="${fieldHtmlId}" name="-" value="${field.value?html}" />
            <input type="hidden" id="${controlId}-added" name="${field.name}_added" />
            <input type="hidden" id="${controlId}-removed" name="${field.name}_removed" />
            <div id="${controlId}-itemGroupActions" class="show-picker"></div>

            <@renderPickerHTML controlId />
         </#if>
      </div>
   </#if>
</div>
            
