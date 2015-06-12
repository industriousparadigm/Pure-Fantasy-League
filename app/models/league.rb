class League < ActiveRecord::Base
  has_many :teams
  has_many :managers, dependent: :delete_all
  has_many :users, through: :managers
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  normalize_attribute :title
  before_create :set_season

  default_scope { order :season }
  scope :current_season, -> { where season: Season.current }
  scope :by_season, -> season { where season: season }


  def to_s
    title
  end

  def season
    Season.new read_attribute(:season)
  end

  def current_season?
    Season.current == season
  end


  private

    def set_season
      self.season = Season.current
    end

end
