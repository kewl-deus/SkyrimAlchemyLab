import skyrimalchemylab.Language

class BootStrap {

    def alchemyService

    def init = { servletContext ->
        
        Language langDE = new Language(name: "Deutsch", isoCode: "de")
        langDE.save(flush: true)
        Language langEN = new Language(name: "Englisch", isoCode: "en")
        langEN.save(flush: true)
        
        alchemyService.insertEffects()
        alchemyService.insertEffectAliases()
        alchemyService.insertIngredients()
        alchemyService.insertIngredientAliases()
    }
    def destroy = {
    }



}
