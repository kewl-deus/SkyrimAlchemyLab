<%@ page import="skyrimalchemylab.EffectImpl" %>



<div class="fieldcontain ${hasErrors(bean: effectImplInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="effectImpl.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${effectImplInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: effectImplInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="effectImpl.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="255" value="${effectImplInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: effectImplInstance, field: 'positive', 'error')} ">
	<label for="positive">
		<g:message code="effectImpl.positive.label" default="Positive" />
		
	</label>
	<g:checkBox name="positive" value="${effectImplInstance?.positive}" />
</div>

