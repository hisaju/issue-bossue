class CreateIssues < ActiveRecord::Migration[7.2]
  def change
    create_table :issues do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.string :repository_id, null: false
      t.string :repository_name, null: false
      t.string :issue_id, null: false
      t.string :issue_url, null: false
      t.timestamps
    end
  end
end
