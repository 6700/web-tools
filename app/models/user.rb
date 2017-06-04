class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :domains, dependent: :destroy

  def self.from_omniauth(auth)
    User.find_or_create_by!(github_id: auth['id']) do |u|
      u.avatar_url = auth.extra.raw_info.avatar_url,
      u.first_name = auth.info.name,
      u.email = auth.info.email,
      u.password = Devise.friendly_token[0,20]
    end
  end
end
