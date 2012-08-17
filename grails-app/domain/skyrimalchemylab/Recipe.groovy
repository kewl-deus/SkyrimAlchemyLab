package skyrimalchemylab

class Recipe {

    String name

    static hasMany = [ingredients: Ingredient, effects: Effect]

    static constraints = {
        name blank: false
        
        effects validator: {val, obj ->

            Set<Effect> providedEffects = []
            obj.ingredients.each { ing ->
                providedEffects.addAll(ing.providedEffects)
            }
            
            obj.effects.each { eff ->
                if (! providedEffects.contains(eff)){
                    return ['recipe.validator.unprovidedeffect.error', eff, providedEffects]
                }
            }

            return true
        }

        ingredients validator: {val, obj ->
            int ingAmount = obj.ingredients.size()
            if (ingAmount < 2 || ingAmount > 3){
                return 'recipe.validator.wrongingredientamount.error'
            }
            return true
        }
    }


    boolean isToxic(){
        int numPos = effects.count {eff -> eff.positive}
        int numNeg = effects.size() - numPos
        return numNeg > numPos
    }

    @Override
    String toString() {
        return name
    }

}
