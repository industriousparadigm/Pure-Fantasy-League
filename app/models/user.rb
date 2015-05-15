class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  before_create :make_first_admin


  def to_s
    name
  end


  private

    def make_first_admin
      self.admin = true if self.class.count < 1
    end

end
