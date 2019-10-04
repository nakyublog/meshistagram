class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :micropost_id
      t.integer :comment_id
      t.string :action
      t.boolean :checked,default: false

      t.timestamps
    end
        add_index :notifications, :visiter_id
        add_index :notifications, :visited_id
  end
end
