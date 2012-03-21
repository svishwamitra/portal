class ApplicationController < ActionController::Base
  protect_from_forgery
  def like  
      if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
        'ilike'
      else
        'like'
      end
  end
end
