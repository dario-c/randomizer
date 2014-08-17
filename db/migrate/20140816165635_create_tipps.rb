class CreateTipps < ActiveRecord::Migration
  def change
    create_table :tipps do |t|
      t.integer :city_id
      t.string :name
      t.string :streetname
      t.timestamps
    end
  end
end
