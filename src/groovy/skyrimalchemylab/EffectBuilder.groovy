package skyrimalchemylab

class EffectBuilder {

    private effects
    private Language lang

    public EffectBuilder(Language lang){
        this.effects = []
        this.lang = lang
    }

    EffectImpl effect(String name, String nature){
        EffectImpl effect = new EffectImpl(name:name, positive: nature == '+')
        this.effects << effect
        effect
    }

    EffectAlias alias(String alias, String origin){
        EffectImpl originEffect = null
        originEffect = effects.find { it.name == origin }
        switch (originEffect){
            case EffectImpl:
                break
            default:
                originEffect = EffectImpl.findByName(origin)
        }

        if (originEffect){
            EffectAlias aliasEffect = new EffectAlias(name: alias, aliased: originEffect, lang: this.lang)
            this.effects << aliasEffect
            return aliasEffect
        } else {
            throw new NoSuchElementException("Effect $origin not found")
        }
    }

    void withEffects(Closure<Effect> closure){
        effects.each closure
    }
}
