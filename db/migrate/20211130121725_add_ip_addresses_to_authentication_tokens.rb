class AddIpAddressesToAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :authentication_tokens, :ip_address, :string
  end
end
