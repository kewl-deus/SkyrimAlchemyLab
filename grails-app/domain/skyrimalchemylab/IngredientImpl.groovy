package skyrimalchemylab

class IngredientImpl extends Ingredient{

    int price
    float weight

    static hasMany = [effects: Effect]

    static constraints = {
        source nullable: true
        
        effects validator: {val, obj ->
            if (obj?.effects?.size() > 4){
                return 'ingredient.validator.toomucheffects.error'
            } else {
                return true
            }
        }
    }

    @Override
    Set<Effect> getProvidedEffects(){
        this.effects
    }

}
