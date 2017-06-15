class Domain < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user }

  belongs_to :user
end
  
