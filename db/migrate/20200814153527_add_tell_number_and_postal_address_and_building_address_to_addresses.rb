class AddTellNumberAndPostalAddressAndBuildingAddressToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :tell_number, :string
    add_column :addresses, :postal_address, :string
    add_column :addresses, :building_address, :string
  end
end
