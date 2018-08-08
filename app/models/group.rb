class Group < ApplicationRecord
  #association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  #validation
  validates :name, presence: true, uniqueness: true, length: {minimum: 3}
end
