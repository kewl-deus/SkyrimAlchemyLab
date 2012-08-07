<%@ page import="skyrimalchemylab.Recipe" %>



<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="recipe.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${recipeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'effects', 'error')} ">
	<label for="effects">
		<g:message code="recipe.effects.label" default="Effects" />
		
	</label>
	<g:select name="effects" from="${skyrimalchemylab.Effect.list()}" multiple="multiple" optionKey="id" size="5" value="${recipeInstance?.effects*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="recipe.ingredients.label" default="Ingredients" />
		
	</label>
	<g:select name="ingredients" from="${skyrimalchemylab.Ingredient.list()}" multiple="multiple" optionKey="id" size="5" value="${recipeInstance?.ingredients*.id}" class="many-to-many"/>
</div>

