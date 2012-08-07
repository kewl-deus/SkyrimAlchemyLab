package skyrimalchemylab

abstract class Effect{

    String name
    static constraints = {
        name blank: false, unique: true
    }

    @Override
    String toString() {
        return name
    }

    abstract boolean isPositive()

    boolean isNegative(){
        return ! isPositive()
    }

    @Override
    boolean equals(Object obj) {
        switch(obj){
            case Effect:
                Effect other = (Effect) obj
                return this.name == other.name
            default:
                return false
        }
    }


}
