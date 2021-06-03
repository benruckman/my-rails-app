class CreateBillingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :billing_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.text :email
      t.text :address1
      t.text :address2
      t.string :country
      t.string :state
      t.text :zip

      t.timestamps
    end
  end
end
