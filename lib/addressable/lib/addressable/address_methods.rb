module ActsAsAddressable
  # including this module into your Address model will give you finders and named scopes
  # useful for working with Addresss.
  # The named scopes are:
  # in_order: Returns Addresss in the order they were created (created_at ASC).
  # recent: Returns Addresss by how recently they were created (created_at DESC).
  # limit(N): Return no more than N Addresss.
  module Address
    def self.included(address_model)
      address_model.extend Finders
      address_model.scope :in_order, address_model.order('created_at ASC')
      address_model.scope :recent, address_model.order('created_at DESC')
    end

    module Finders
      # Helper class method to look up all Addresss for
      # Addressable class name and Addressable id.
      def find_address_for_addressable(addressable_str, addressable_id)
        where(["addressable_type = ? and addressable_id = ?", addressable_str, addressable_id]).order("created_at DESC")
      end

      # Helper class method to look up a Addressable object
      # given the Addressable class name and id
      def find_addressable(addressable_str, addressable_id)
        model = addressable_str.constantize
        model.respond_to?(:find_addresss_for) ? model.find(addressable_id) : nil
      end
    end
  end
end
