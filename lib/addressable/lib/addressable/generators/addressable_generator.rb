require 'rails/generators/migration'

class AddressableGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @_acts_as_addressable_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    #template "address.rb", "app/models/address.rb"
    migration_template "create_addresses.rb", "db/migrate/create_addresses.rb"
  end
end
