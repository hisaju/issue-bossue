class CreateIssueApplies < ActiveRecord::Migration[7.2]
  def change
    create_table :issue_applies do |t|
      t.references :bossue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
