class Trip < ApplicationRecord
  belongs_to :user

  has_many :activities, dependent: :destroy

  scope :for_user, ->(user) { where(user: user) }
end
