class ApplicationController < ActionController::Base
  protect_from_forgery
  def like_or_ilike  
      if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
        s = 'ilike'
      else
        s = 'like'
      end
      @s ||= s
  end
end
