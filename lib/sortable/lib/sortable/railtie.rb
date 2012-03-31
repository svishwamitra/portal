module Sortable
	class Railtie < Rails::Railtie
		initializer 'sortable.model_additions' do
			ActiveSupport.on_load :active_record do
				extend ModelAdditions				
			end
		end
	end
end
