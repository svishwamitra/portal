class CreateCrmAccountContacts < ActiveRecord::Migration
  def change
    create_table :crm_account_contacts do |t|
      t.integer :contact_id
      t.integer :account_id
      
      t.timestamps
    end
  end
end
