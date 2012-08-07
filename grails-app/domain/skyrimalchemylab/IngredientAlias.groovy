package skyrimalchemylab

class IngredientAlias extends Ingredient{

    @Delegate IngredientImpl aliased
    Language lang

    static constraints = {
        aliased nullable: false
        lang nullable: false
    }

}
