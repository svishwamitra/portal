module Addressable
  module ApplicationHelper
    def render_addressable_show(form_obj)
      render 'show', :obj => form_obj
    end
  end
end
