module Crm
  class AccountContact < ActiveRecord::Base
    belongs_to :contact
    belongs_to :account,:class_name => "Company::Account"
  end
end
