package skyrimalchemylab

abstract class Effect{

    String name
    String description
    Language lang
    
    static constraints = {
        name blank: false, unique: 'lang'
        description nullable: true
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

    @Override
    boolean equals(Object obj) {
        switch(obj){
            case Effect:
                Effect other = (Effect) obj
                return this.name == other.name && this.lang == other.lang
            default:
                return false
        }
    }


}
