module Sortable
	module ModelAdditions
		def searchable_columns(attributes)
			Sortable.searchable_columns = attributes
      Sortable.model_name = self #:TODO find another alternative for not to pass model_name
		end
		def conditional_pagesort(params, options = {})
      Sortable.conditional_pagesort(params, options)
		end
	end
end
