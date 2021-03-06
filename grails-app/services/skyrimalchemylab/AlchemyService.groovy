package skyrimalchemylab

class AlchemyService {

    def findIngredientsWithEffect(String effectName){
        //FIXME maybe we need lang as additional parameter here
        def eff = EffectImpl.findByName(effectName)
        findIngredientsWithEffect(eff)
    }

    def findIngredientsWithEffect(Effect eff){
        def ings = IngredientImpl.withCriteria{
            effects {
                eq 'id', eff.id
            }
            order 'name', 'asc'
        }
        return ings
    }

    def findAliases(EffectImpl effect){
        EffectAlias.findByAliased(effect)
    }

    def findAliases(IngredientImpl ingredient){
        IngredientAlias.findByAliased(ingredient)
    }
}
