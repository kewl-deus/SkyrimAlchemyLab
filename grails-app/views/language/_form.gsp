<%@ page import="skyrimalchemylab.Language" %>



<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="language.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${languageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: languageInstance, field: 'isoCode', 'error')} required">
	<label for="isoCode">
		<g:message code="language.isoCode.label" default="Iso Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="isoCode" maxlength="2" required="" value="${languageInstance?.isoCode}"/>
</div>

