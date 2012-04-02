require File.expand_path("../sortable/engine", __FILE__)
require File.expand_path("../sortable/version", __FILE__)
require File.expand_path("../sortable/model_additions", __FILE__)
require File.expand_path("../sortable/sortable_helper", __FILE__)
require File.expand_path("../sortable/railtie", __FILE__) if defined? Rails

module Sortable

   mattr_accessor :searchable_columns
   mattr_accessor :model_name

   def self.conditional_pagesort(params, options = {})
     # TODO : for date columns the like and ilike dosent work so need to handle date datatype
     if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
        s = 'ilike'
        date_form = "::text"  # converts date and timestap to string
      else
        s = 'like'
        date_form = ''
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

        arr = val[0].split(".")
        d_type = "#{model_name.columns_hash[arr[arr.length-1].to_s].type}"
        
        #Code to build conditions according to the data type
        if ['date','datetime'].include?(d_type)
          conditions +=  "#{val[0] + date_form} #{s} ?"
          p << "#{params[key].to_s}%"
        elsif ['integer','float'].include?(d_type)
          conditions +=  "#{val[0].to_s} = ?"
          p << "#{params[key]}"
        else
          conditions += "#{val[0]} #{s} ?"
          p << "#{params[key].to_s}%"
        end

      end
      p.unshift(conditions)
      #'***************************************'
      model_name.paginate(:page => params[:page], :per_page => 5).includes(options[:includes]).where("#{model_name.table_name}.name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
      #where("name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
    end
   
end
