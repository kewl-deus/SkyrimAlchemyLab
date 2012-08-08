import skyrimalchemylab.Language

class BootStrap {

    def skyrimResourceService

    def init = { servletContext ->
        skyrimResourceService.initWorld()
    }
    def destroy = {
    }



}
