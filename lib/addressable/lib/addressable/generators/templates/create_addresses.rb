class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :addressable, :polymorphic => true
      t.string :title, :limit => 100, :default => ""
      t.string :street1, :limit => 100, :default => ""
      t.string :street2, :limit => 100, :default => ""
      t.string :city, :limit => 50, :default => ""
      t.string :state, :limit => 50, :default => ""
      t.string :country, :limit => 50, :default => ""
      t.string :zipcode, :limit => 6, :default => ""
      t.timestamps
    end

    add_index :addresses, :addressable_type
    add_index :addresses, :addressable_id
  end

  def self.down
    drop_table :addresses
  end
end
