package skyrimalchemylab

abstract class Ingredient {

    String name
    String source
    Language lang

    static constraints = {
        name blank: false, unique: 'lang'
        source nullable:  true
        lang nullable: false
    }

    static mapping = {
        tablePerHierarchy false
        tablePerSubclass true
    }

    @Override
    String toString() {
        return name
    }

    abstract Set<Effect> getProvidedEffects()
}
