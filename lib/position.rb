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


  def initilize(position)
    @position = position
  end

  def short
    position
  end

end