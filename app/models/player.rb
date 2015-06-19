class Player < ActiveRecord::Base
  enum position: [ :goalkeeper, :fullback, :centreback, :midfielder, :striker ]
  belongs_to :club


  def to_s
    "#{first_name[0]} #{last_name}"
  end

  def position
    @position ||= Position.new(read_attribute(:position))
  end

end
