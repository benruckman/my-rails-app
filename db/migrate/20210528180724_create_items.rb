class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :Name
      t.text :Price
      t.text :Shape
      t.text :Size

      t.timestamps
    end
  end
end
