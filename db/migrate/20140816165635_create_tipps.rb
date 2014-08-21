class CreateTipps < ActiveRecord::Migration
  def change
    create_table :tipps do |t|
      t.integer :city_id
      t.integer :user_id
      t.string :name
      t.string :streetname
      t.string :website
      t.string :twitter
      t.integer :points,       default: 0
      t.timestamps
    end
  end
end
