package skyrimalchemylab

@Category(IngredientBuilder)
class IngredientBuilderCategory {
    /**
     * Usage: @Mixin(IngredientBuilderCategory)
     * @param ingData (name, price, weight, source)
     * @param effects
     * @return
     */

    IngredientImpl ingredient(Map ingData){
        this.ingredient(ingData)
    }
}
