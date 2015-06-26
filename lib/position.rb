class Position
  POSITIONS = [
    {
      title: 'Goalkeeper',
      abbr: 'g'
    },
    {
      title: 'Full-back',
      abbr: 'f'
    },
    {
      title: 'Centre-back',
      abbr: 'c'
    },
    {
      title: 'Midfielder',
      abbr: 'm'
    },
    {
      title: 'Striker',
      abbr: 's'
    }
  ]


  def self.list
    POSITIONS.map { |po| [ po[:title], po[:abbr] ] }
  end


  def initialize(position=nil)
    @position = position
  end

  def abbr
    @position ? POSITIONS[@position][:abbr] : nil
  end

  def title
    @position ? POSITIONS[@position][:title] : nil
  end

  def to_s
    title
  end

end