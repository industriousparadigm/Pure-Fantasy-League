class Team < ActiveRecord::Base
  belongs_to :manager
  belongs_to :league

  normalize_attribute :title
  validates :title, presence: true


  def to_s
    title
  end

end
