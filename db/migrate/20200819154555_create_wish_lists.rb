class CreateWishLists < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
