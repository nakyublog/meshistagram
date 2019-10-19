class CreateJirous < ActiveRecord::Migration[5.2]
  def change
    create_table :jirous do |t|
      t.string :name
      t.text :url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
