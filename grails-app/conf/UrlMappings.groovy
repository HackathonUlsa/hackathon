class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: 'Chofer', action: 'inicio')
		"500"(view:'/error')
	}
}
