class AddImageToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :thumbnail_url, :string
  end
end
