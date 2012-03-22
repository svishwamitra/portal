require 'active_record'

# ActsAsAddressable
module Livia
  module Acts #:nodoc:
    module Addressable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def acts_as_addressable #(*args)
#          comment_roles = args.to_a.flatten.compact.map(&:to_sym)
#          write_inheritable_attribute(:comment_types, (comment_roles.blank? ? [:comments] : comment_roles))
#          class_inheritable_reader(:comment_types)
#
#          options = ((args.blank? or args[0].blank?) ? {} : args[0])

          has_many :addresses, {:as => :addressable, :dependent => :destroy,:class_name => "Addressable::Address"}
          accepts_nested_attributes_for :addresses
#          class_eval %{
#                        def self.find_addresses_for(obj)
#                        addressable = self.base_class.name
#                        Addressable::Address.find_addresses_for_addressable(addressable, obj.id)
#                        end
#                      }
        end #method end
      end # classmethod module end
    end # Addressable module end
  end #Acts module end
end # Livia module end

ActiveRecord::Base.send(:include, Livia::Acts::Addressable)
