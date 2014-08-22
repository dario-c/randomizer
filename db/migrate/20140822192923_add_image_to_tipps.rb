class AddImageToTipps < ActiveRecord::Migration
  def change
    add_column :tipps, :image, :string
  end
end
