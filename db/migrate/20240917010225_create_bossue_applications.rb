class CreateBossueApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :bossue_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bossue, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
