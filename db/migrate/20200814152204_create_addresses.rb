class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :number
      t.string :post_index
      t.string :building_address

      t.timestamps
    end
  end
end
