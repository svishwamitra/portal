module Company
  class Account < ActiveRecord::Base    
    has_many :account_contacts, :class_name => "Crm::AccountContact"
    has_many :contacts, :through => :account_contacts, :class_name => "Crm::Contact"
    
    validates_presence_of :name
    
    attr_accessible :contact_tokens,:name,:email,:phone
    attr_reader :contact_tokens
    acts_as_addressable
    searchable_columns :account_name => "company_accounts.name", :account_email => "company_accounts.email", :account_phone => "company_accounts.phone"
    def contact_tokens=(ids)
      self.contact_ids = ids.split(",")
    end
    
#    def self.conditional_pagesort(params)
#      # **************************************
#      # Check to see if the db conn adapter is
#      # for postgresql and accordingly use
#      # like or ilike
#      # **************************************
#      if ActiveRecord::Base.connection.adapter_name.downcase == 'postgresql'
#        s = 'ilike'
#      else
#        s = 'like'
#      end
#
#      #*****************************************
#      # Build filter conditions
#      # One can actually use where for each
#      # condition instead of these if conditions
#      #*****************************************
#      conditions = ''
#      p = []
#      if params[:account_name]
#        conditions += "company_accounts.name #{s} ?"
#        p << params[:account_name].to_s + "%"
#      end
#      if conditions.length > 0
#        conditions += " and "
#      end
#      if params[:account_email]
#        conditions += "company_accounts.email #{s} ?"
#        p << "#{params[:account_email]}%"
#      end
#      if conditions.length > 0
#        conditions += " and "
#      end
#      if params[:account_phone]
#        conditions += "company_accounts.phone #{s} ?"
#        p << params[:account_phone].to_s + "%"
#      end
#      p.unshift(conditions)
#      puts "*************************"
#      puts p.inspect
#      puts "*************************"
#      #***************************************
#
#      paginate(:page => params[:page], :per_page => 5).where("name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
#    end

  end
end
