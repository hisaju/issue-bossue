class Bossue < ApplicationRecord
  belongs_to :user
  has_many :bossue_applications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :repository_id, presence: true
  validates :issue_number, presence: true
  validates :bossue_sentence, presence: true, length: { maximum: 200 }

  enum status: { open: 0, closed: 1, matched: 2 }
end
