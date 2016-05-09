package hackathon

import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN'])
class SitioController {

    def index() { }
}
