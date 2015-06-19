class Club < ActiveRecord::Base
  has_many :players


  def to_s
    name
  end

end
