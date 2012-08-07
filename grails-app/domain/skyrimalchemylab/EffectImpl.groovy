package skyrimalchemylab

class EffectImpl extends Effect{

    String description
    boolean positive

    static constraints = {
        description nullable: true, maxSize: 255
    }

}
