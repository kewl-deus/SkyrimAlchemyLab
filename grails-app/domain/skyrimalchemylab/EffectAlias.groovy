package skyrimalchemylab

class EffectAlias extends Effect{

    EffectImpl aliased
    Language lang

    @Override
    boolean isPositive() {
        return aliased.positive
    }

    boolean equals(other) {
        switch(other){
            case EffectAlias:
                EffectAlias ea = (EffectAlias) other
                return this.aliased.equals(ea.aliased)
            case EffectImpl:
                EffectImpl ei = (EffectImpl) other
                return this.aliased.equals(ei)
            default:
                return false
        }
    }

    int hashCode() {
        int result
        result = (aliased != null ? aliased.hashCode() : 0)
        return result
    }

}
