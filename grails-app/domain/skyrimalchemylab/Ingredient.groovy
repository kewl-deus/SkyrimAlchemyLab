package skyrimalchemylab

abstract class Ingredient {

    String name

    static constraints = {
        name blank: false, unique: true
    }

    @Override
    String toString() {
        return name
    }

    abstract Set<Effect> getProvidedEffects()
}
