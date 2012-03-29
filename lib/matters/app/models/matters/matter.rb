module Matters
  class Matter < ActiveRecord::Base
    self.table_name = "matters"
    belongs_to :contact, :class_name => "Crm::Contact"
    attr_accessible :linked_contact_tokens, :name, :brief, :matter_no, :ref_no, :description, :matter_date, :client_access, :is_internal, :parent_id, :contact_id, :account_id
    attr_reader :linked_contact_tokens

    def linked_contact_tokens=(id)
      self.contact_id = id
    end
    
  end
end
