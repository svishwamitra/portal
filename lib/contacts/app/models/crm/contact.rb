module Crm
  class Contact < ActiveRecord::Base    
    has_many :account_contacts
    has_many :accounts, :through => :account_contacts, :class_name => "Company::Account"
    has_many :matters, :class_name => "Matters::Matter"
    validates_presence_of :name
    
    attr_accessible :account_tokens,:name,:email,:phone
    attr_reader :account_tokens
    acts_as_addressable
    searchable_columns :contact_name => "crm_contacts.name", :contact_email => "crm_contacts.email", :contact_phone => "crm_contacts.phone"
    self.per_page = 5
    
    def account_tokens=(ids)
      self.account_ids = ids.split(",")
    end
    
 end
end
