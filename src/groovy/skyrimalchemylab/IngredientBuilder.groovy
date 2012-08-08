package skyrimalchemylab


class IngredientBuilder {

    private ingredients
    private Language lang

    public IngredientBuilder(Language lang){
        this.ingredients = []
        this.lang = lang
    }

    IngredientImpl ingredient(Map ingData){
        String name = ingData.name
        int price = ingData.price ?: 0
        float weigth = ingData.weight ?: 0f
        String source = ingData.source

        def effects = ingData.effects.collect {
            switch(it){
                case Effect:
                    it
                    break
                case String:
                    String effName = it.toString()
                    def effByName = EffectImpl.findByName(effName)
                    if (!effByName) effByName = EffectAlias.findByName(effName)
                    effByName
                    break
                default:
                    null
            }
        }.findAll {
            it != null
        }
        
        IngredientImpl ing = new IngredientImpl(name: name, price: price, weight: weigth, source: source, lang: this.lang, effects: effects)

        if (!ing.validate()){
            String errMsg = ing.errors.allErrors.join(", ")
            throw new IllegalArgumentException("Invalid arguments for creating an ingredient: " + errMsg)
        }

        this.ingredients << ing
        return ing
    }

    IngredientAlias alias(String alias, String origin){
        //first lookup in member variable
        IngredientImpl originIngredient = null
        originIngredient = ingredients.find { it.name == origin }
        switch (originIngredient){
            case IngredientImpl:
                //found in local cache
                break
            default:
                //not cached locally lookup in repository
                originIngredient = IngredientImpl.findByName(origin)
        }

        if (originIngredient){
            IngredientAlias aliasIngredient = new IngredientAlias(name: alias, aliased: originIngredient, lang: this.lang)
            this.ingredients << aliasIngredient
            return aliasIngredient
        } else {
            throw new NoSuchElementException("Ingredient $origin not found")
        }
    }

    void withIngredients(Closure<Ingredient> closure){
        ingredients.each closure
    }

    int getAmount(){
        ingredients?.size()
    }
}
