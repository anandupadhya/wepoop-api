class RemoveIpAddresesFromAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    remove_column :authentication_tokens, :ip_addres, :string
  end
end
