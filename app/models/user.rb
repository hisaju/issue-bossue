class User < ApplicationRecord
  has_many :bossues, dependent: :destroy

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
