class Group < ApplicationRecord
  #association
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  #validation
  validates :name, presence: true, uniqueness: true, length: {minimum: 3}

  def display_latest_message
    if self.messages.last && self.messages.last.content.present?
      self.messages.last.content
    elsif self.messages.last && self.messages.last.image
      "画像が表示されています。"
    else
      "メッセージが投稿されていません。"
    end
  end
end
