class Meetup < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }
  validates :format, presence: true, length: { maximum: 50 }
  validates :date, presence: true
end
