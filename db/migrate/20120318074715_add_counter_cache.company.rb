# This migration comes from company (originally 20120315103500)
class AddCounterCache < ActiveRecord::Migration
  def up
   add_column :company_accounts, :contacts_count, :integer, :default => 0

   Company::Account.reset_column_information
   Company::Account.all.each do |act|
    Company::Account.update_counters act.id, :contacts_count => act.contacts.length
   end
  end

  def down
   remove_column :company_accounts, :contacts_count
  end
end
