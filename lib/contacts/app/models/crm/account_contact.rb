module Crm
  class AccountContact < ActiveRecord::Base
    belongs_to :contact
    belongs_to :account,:class_name => "Company::Account" #, :counter_cache => true
  end
end
