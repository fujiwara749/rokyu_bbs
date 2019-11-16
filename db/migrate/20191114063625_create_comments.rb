class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :board_id
      t.string :comment
      t.text :image_id
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
