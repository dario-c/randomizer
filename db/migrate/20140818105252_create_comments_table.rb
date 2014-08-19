class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :tipp_id
      t.text :content
      t.references :user, index: true
      t.references :tipp, index: true
    end
  end
end
