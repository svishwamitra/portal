require File.expand_path("../sortable/engine", __FILE__)
require File.expand_path("../sortable/version", __FILE__)
require File.expand_path("../sortable/model_additions", __FILE__)
require File.expand_path("../sortable/sortable_helper", __FILE__)
require File.expand_path("../sortable/railtie", __FILE__) if defined? Rails

module Sortable

   mattr_accessor :searchable_columns
   mattr_accessor :model_name

   def self.conditional_pagesort(params)
     if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
        s = 'ilike'
      else
        s = 'like'
      end

      #************************************
      # Build filter conditions
      #************************************

      conditions = ''
      p = []
      searchable_columns.each do |key, val|
        if conditions.length > 0
          conditions += " and "
        end
        conditions += "#{val[0]} #{s} ?"
        p << "#{params[key].to_s}%"
      end
      p.unshift(conditions)
      #***************************************
      model_name.paginate(:page => params[:page], :per_page => 5).where("name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
      #where("name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
    end

end
