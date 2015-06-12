class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
         :validatable

  has_many :managers
  has_many :leagues, through: :managers
  accepts_nested_attributes_for :managers
  validates :name, presence: true
  before_create :make_first_admin

  attr_accessor :new_invitation


  def self.has_admin?
    count > 0
  end


  def to_s
    name
  end

  # If there is no admin user or this is a manager accepting an invite, then password is required.
  # Otherwise, no password is required.
  def password_required?
    !self.class.has_admin? || !new_invitation
  end


  private

    # Make this user an admin if it is first user created.
    def make_first_admin
      self.admin = true unless self.class.has_admin?
    end

end
