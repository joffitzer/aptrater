class AddAvatarToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :avatar, :string
  end
end
