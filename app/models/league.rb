class League < ActiveRecord::Base
  has_many :teams
  has_many :managers
  has_many :users, through: :managers
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  normalize_attribute :title
  before_create :set_season

  def to_s
    title
  end


  private

    def set_season
      self.season = Season.current
    end

end
