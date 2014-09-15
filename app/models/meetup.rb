class MeetupValidator < ActiveModel::Validator
  def validate(record)
    unless record
      return
    end

    # ----- start in past -----
    if !record.start_date.nil? && record.start_date <= Time.now
      record.errors.add(:start_date, "The start date should be after now.")
    end
    # ----- end meetup before start -----
    if !record.end_date.nil? && !record.start_date.nil? && record.end_date <= record.start_date
      record.errors.add(:end_date, "The end date should be after the start date.")
    end
  end
end

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
  validates_with MeetupValidator
end
