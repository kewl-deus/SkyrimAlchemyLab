<%@ page import="skyrimalchemylab.IngredientImpl" %>



<div class="fieldcontain ${hasErrors(bean: ingredientImplInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredientImpl.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientImplInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientImplInstance, field: 'source', 'error')} ">
	<label for="source">
		<g:message code="ingredientImpl.source.label" default="Source" />
		
	</label>
	<g:textField name="source" value="${ingredientImplInstance?.source}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientImplInstance, field: 'effects', 'error')} ">
	<label for="effects">
		<g:message code="ingredientImpl.effects.label" default="Effects" />
		
	</label>
	<g:select name="effects" from="${skyrimalchemylab.Effect.list()}" multiple="multiple" optionKey="id" size="5" value="${ingredientImplInstance?.effects*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientImplInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="ingredientImpl.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="price" required="" value="${fieldValue(bean: ingredientImplInstance, field: 'price')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ingredientImplInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="ingredientImpl.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="weight" required="" value="${fieldValue(bean: ingredientImplInstance, field: 'weight')}"/>
</div>

