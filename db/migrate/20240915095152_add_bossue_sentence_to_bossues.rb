class AddBossueSentenceToBossues < ActiveRecord::Migration[7.2]
  def change
    add_column :bossues, :bossue_sentence, :string
  end
end
