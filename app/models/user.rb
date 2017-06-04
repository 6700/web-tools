class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    User.find_or_initialize_by(github_id: auth['id']).tap do |u|
      u.update!(
        avatar_url: auth.extra.raw_info.avatar_url,
        first_name: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
  end
end
