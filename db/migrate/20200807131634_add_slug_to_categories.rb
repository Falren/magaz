class AddSlugToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true

    add_column :products, :slug, :string
    add_index :products, :slug, unique: true
  end
end
