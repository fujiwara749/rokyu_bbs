class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :comment_id
      t.string :thread_title
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
