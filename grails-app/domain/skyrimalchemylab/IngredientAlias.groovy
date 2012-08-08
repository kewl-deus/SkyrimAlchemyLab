package skyrimalchemylab

class IngredientAlias extends Ingredient{

    @Delegate IngredientImpl aliased

    static constraints = {
        aliased nullable: false
    }

}
