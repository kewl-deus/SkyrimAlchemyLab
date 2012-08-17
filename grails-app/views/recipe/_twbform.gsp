<%@ page import="skyrimalchemylab.Recipe" %>

<div class="container">
<div class="row">
    <div class="span12">
        <div class="row">
            <div class="span2">
                <g:message code="recipe.name.label" default="Name"/>
            </div>

            <div class="span4">
                <g:textField name="name" required="" value="${recipeInstance?.name}"/>
            </div>
        </div>
    </div>

    <div class="span12">
        <div class="row">
            <div class="span2">Zutatenliste:</div>
        </div>
    </div>

    <div class="span12">
        <div class="row">
            <div class="span2">1. Zutat</div>

            <div class="span3">
                <g:select name="firstIngredientId"
                          required=""
                          from="${ingredientList}"
                          optionKey="id"
                          value="${recipeInstance?.ingredients?.get(0)?.id}"
                          noSelection="[0: '']"/>
            </div>
        </div>
    </div>

    <div class="span12">
        <div class="row">
            <div class="span2">2. Zutat</div>

            <div class="span3">
                <g:select name="secondIngredientId"
                          from="${ingredientList}"
                          optionKey="id"
                          value="${recipeInstance?.ingredients?.get(1)?.id}"
                          noSelection="[0: '']"/>
            </div>
        </div>
    </div>

    <div class="span12">
        <div class="row">
            <div class="span2">3. Zutat (optional)</div>

            <div class="span3">
                <g:select name="optionalIngredientId"
                          required=""
                          from="${ingredientList}"
                          optionKey="id"
                          value="${recipeInstance?.ingredients?.get(2)?.id}"
                          noSelection="[0: '']"/>
            </div>
        </div>
    </div>


    <!-- effects -->

    <div class="span12">
        <div class="row">
            <div class="span2">
                Effekte:
            </div>
        </div>
    </div>


    <g:each in="(0..3)" status="i" var="rangeItem">


        <div class="span12">
            <div class="row">
                <div class="span2">${i+1}. Effekt</div>

                <div class="span3">
                    <g:select name="effect${i+1}"
                              required=""
                              from="${effectList}"
                              optionKey="id"
                              value="${recipeInstance?.effects?.get(i)?.id}"
                              noSelection="[0: '']"/>
                </div>
            </div>
        </div>
    </g:each>



</div>
</div>