class AddPasswordDigestToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :password_digest, :string
  end
end
