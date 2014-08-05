class User < ActiveRecord::Base
  has_many :meetups
  has_many :attendances, dependent: :destroy
  has_many :attend_meetups, through: :attendances, source: :meetup

  before_save { self.email = email.downcase }
  before_create :create_remember_roken

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validation
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # attend meetup
  def attend_meetup!(meetup)
    attendances.create!(meetup_id: meetup.id)
  end

  # cancel to attend meetup
  def cancel_meetup!(meetup)
    attendances.find_by(meetup_id: meetup.id).destroy
  end

  # check attendance
  def attend_meetup?(meetup)
    attendances.find_by(meetup_id: meetup.id)
  end

  private
    def create_remember_roken
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
