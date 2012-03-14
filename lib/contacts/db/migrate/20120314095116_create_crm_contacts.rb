class CreateCrmContacts < ActiveRecord::Migration
  def change
    create_table :crm_contacts do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
