module Crm
  class Contact < ActiveRecord::Base    
    has_many :account_contacts
    has_many :accounts, :through => :account_contacts, :class_name => "Company::Account"
    
    validates_presence_of :name
    
    attr_accessible :account_tokens,:name,:email,:phone
    attr_reader :account_tokens
    
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
      paginate(:page => params[:page], :per_page => 5).where("name #{s} ?", "#{params[:char]}%")
    end
    
  end
end
