<%@ page import="skyrimalchemylab.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="ingredient.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${ingredientInstance?.source}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="ingredient.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lang" name="lang.id" from="${skyrimalchemylab.Language.list()}" optionKey="id" required="" value="${ingredientInstance?.lang?.id}" class="many-to-one"/>
</div>

