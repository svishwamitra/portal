module Crm
  class Contact < ActiveRecord::Base    
    has_many :account_contacts
    has_many :accounts, :through => :account_contacts, :class_name => "Company::Account"
    attr_accessible :account_tokens,:name,:email,:phone
    attr_reader :account_tokens
    
    def account_tokens=(ids)
      self.account_ids = ids.split(",")
    end
  end
end
