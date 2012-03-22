module Company
  class Account < ActiveRecord::Base    
    has_many :account_contacts, :class_name => "Crm::AccountContact"
    has_many :contacts, :through => :account_contacts, :class_name => "Crm::Contact"
    
    validates_presence_of :name
    
    attr_accessible :contact_tokens,:name,:email,:phone
    attr_reader :contact_tokens
    acts_as_addressable
    def contact_tokens=(ids)
      self.contact_ids = ids.split(",")
    end
  end
end
