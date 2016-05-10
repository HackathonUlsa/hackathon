class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'historial', action: 'inicio')
		"500"(view:'/error')
	}
}
