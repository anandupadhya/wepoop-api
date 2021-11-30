class AddUserAgentsToAuthenticationTokens < ActiveRecord::Migration[6.0]
  def change
    add_column :authentication_tokens, :user_agent, :string
  end
end
