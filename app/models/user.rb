class User < ApplicationRecord
  has_many :bossues, dependent: :destroy

  def self.from_omniauth(auth)
    logger.debug "auth: #{auth.inspect}"
    user = find_or_initialize_by(uid: auth.uid)
    user.assign_attributes(
      uid: auth.uid,
      name: auth.info.name,
      email: auth.info.email,
      thumbnail_url: auth.info.image
    )
    user.save!
    user
  end
end
