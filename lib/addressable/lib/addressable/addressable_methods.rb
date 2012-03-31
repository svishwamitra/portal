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

          has_many :addresses, {:as => :addressable, :dependent => :destroy, :class_name => "Addressable::Address"}
          accepts_nested_attributes_for :addresses

        end #method end
      end # classmethod module end
    end # Addressable module end
  end #Acts module end
end # Livia module end

ActiveRecord::Base.send(:include, Livia::Acts::Addressable)
