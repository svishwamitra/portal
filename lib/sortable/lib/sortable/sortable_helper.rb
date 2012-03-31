module SortableHelper
  def searchable_view
    @head_columns = Sortable.searchable_columns
    p "1111111111"
    p @head_columns
    p params
    render 'sortable/head' #, :head_columns => Sortable.searchable_columns
  end
end
