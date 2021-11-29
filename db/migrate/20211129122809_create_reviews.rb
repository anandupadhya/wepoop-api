class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :toilet, null: false, foreign_key: true
      t.boolean :happy
      t.string :status
      t.text :comment

      t.timestamps
    end
  end
end
