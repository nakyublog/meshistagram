class AddImageUrlToJirous < ActiveRecord::Migration[5.2]
  def change
    add_column :jirous, :image_url, :text
  end
end
