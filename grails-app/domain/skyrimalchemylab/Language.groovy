package skyrimalchemylab

class Language {

    String name
    String isoCode
    
    static constraints = {
        name blank: false
        isoCode blank: false, minSize: 2, maxSize: 2, unique: true
    }

    @Override
    String toString() {
        return name
    }
}
