class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attend_users, through: :attendances, source: :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :short_description, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
