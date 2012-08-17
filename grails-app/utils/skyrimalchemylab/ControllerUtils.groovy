package skyrimalchemylab

class ControllerUtils {

    static Map createAlphabeticPagination(Collection letters, String currentLetter){
        def pagination = [:]

        pagination.letters = letters.unique().sort()
        pagination.current = 'A'

        if (currentLetter) pagination.current = currentLetter

        int currentIndex = pagination.letters.indexOf(pagination.current)

        if (currentIndex > 0){
            pagination.previous = pagination.letters[currentIndex - 1]
        }
        if (currentIndex < pagination.letters.size()){
            pagination.next = pagination.letters[currentIndex + 1]
        }

        return pagination
    }
}
