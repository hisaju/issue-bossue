class CreateBossues < ActiveRecord::Migration[7.2]
  def change
    create_table :bossues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :status, default: 0
      t.string :repository_id, null: false
      t.string :issue_number, null: false
      t.timestamps
    end
  end
end
