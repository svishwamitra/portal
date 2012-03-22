module Addressable
  class Address < ActiveRecord::Base
    self.table_name = "addresses"
    include ActsAsAddressable::Address
    belongs_to :addressable , :polymorphic => true
  end
end