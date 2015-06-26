class Player < ActiveRecord::Base
  enum position: [ :g, :f, :c, :m, :s ]
  belongs_to :club

  validates :first_name, :last_name, :club, :position, presence: true


  def to_s
    "#{first_name[0]} #{last_name}"
  end

  def position
    @position ||= read_attribute(:position) ? Position.new(read_attribute(:position)) : nil
  end

end
