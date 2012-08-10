<%@ page import="skyrimalchemylab.Recipe" %>

<div class="row-fluid">
    <div class="span12">
        <div class="row">
            <div class="span1">
                <g:message code="recipe.name.label" default="Name" />
            </div>
            <div class="span4">
                <g:textField name="name" required="" value="${recipeInstance?.name}"/>
            </div>
        </div>
    </div>

    <hr/>

    <div class="span12">
    </div>

</div>



<div class="fieldcontain ${hasErrors(bean: recipeInstance, field: 'name', 'error')} required">
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

