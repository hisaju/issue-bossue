class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :email
      t.timestamps
    end
  end
end
