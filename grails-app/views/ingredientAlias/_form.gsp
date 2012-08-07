<%@ page import="skyrimalchemylab.IngredientAlias" %>



<div class="fieldcontain ${hasErrors(bean: ingredientAliasInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredientAlias.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientAliasInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientAliasInstance, field: 'aliased', 'error')} required">
	<label for="aliased">
		<g:message code="ingredientAlias.aliased.label" default="Aliased" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aliased" name="aliased.id" from="${skyrimalchemylab.Ingredient.list()}" optionKey="id" required="" value="${ingredientAliasInstance?.aliased?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientAliasInstance, field: 'lang', 'error')} required">
	<label for="lang">
		<g:message code="ingredientAlias.lang.label" default="Lang" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lang" name="lang.id" from="${skyrimalchemylab.Language.list()}" optionKey="id" required="" value="${ingredientAliasInstance?.lang?.id}" class="many-to-one"/>
</div>

