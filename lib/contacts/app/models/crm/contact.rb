module Crm
  class Contact < ActiveRecord::Base    
    has_many :account_contacts
    has_many :accounts, :through => :account_contacts, :class_name => "Company::Account"
    
    validates_presence_of :name
    
    attr_accessible :account_tokens,:name,:email,:phone
    attr_reader :account_tokens
    acts_as_addressable
    self.per_page = 5
    
    def account_tokens=(ids)
      self.account_ids = ids.split(",")
    end
    
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
      if params[:contact_name]
        conditions += "crm_contacts.name #{s} ?"
        p << params[:contact_name].to_s + "%"
      end
      if conditions.length > 0
        conditions += " and "
      end
      if params[:contact_email]
        conditions += "crm_contacts.email #{s} ?"
        p << "#{params[:contact_email]}%"
      end
      if conditions.length > 0
        conditions += " and "
      end
      if params[:contact_phone]
        conditions += "crm_contacts.phone #{s} ?"
        p << params[:contact_phone].to_s + "%"
      end
      p.unshift(conditions)
      puts "*************************"
      puts p.inspect
      puts "*************************"
      #***************************************
      
      paginate(:page => params[:page], :per_page => 5).where("name #{s} ?", "#{params[:char]}%").where(p).order(params[:sort])
    end
  end
end
