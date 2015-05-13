class League < ActiveRecord::Base

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }


  def to_s
    title
  end

end
