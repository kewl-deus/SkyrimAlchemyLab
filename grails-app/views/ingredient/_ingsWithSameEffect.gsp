<g:each in="${ingredientsWithSameEffect[ingredientInstance.id]}" var="otherIng">
    <li><g:link action="show" id="${otherIng.id}">${otherIng.name}</g:link></li>
</g:each>