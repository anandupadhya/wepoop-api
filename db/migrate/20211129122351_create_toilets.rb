class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :accessibility
      t.boolean :changing_station
      t.text :directions
      t.boolean :male
      t.boolean :female
      t.boolean :approved
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
