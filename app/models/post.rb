class Post < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: { maximum: 141 }

  def to_s
    message
  end

  def self.from_users_followed_by(user)
	  followed_user_ids = user.followed_user_ids
	  where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end

end
