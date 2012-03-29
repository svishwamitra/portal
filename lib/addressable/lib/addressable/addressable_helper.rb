module AddressableHelper
  # including this module into your Helper will give you
  # two method render_addressable_show and render_addressable_new
  # The method render_addressable_show:
  # will render the address show view in your engines view
  # this method require resource instacne_object to show the details
  # The method method render_addressable_new:
  # will render the address new view in your engines view
  # this method require resource form object to add addressable form objects.
  def render_addressable_show(form_obj)
    render '/addressable/addresses/show', :obj => form_obj
  end

  def render_addressable_new(form_obj)
    render '/addressable/addresses/address', :f => form_obj
  end
end
