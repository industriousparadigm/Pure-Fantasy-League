class Season
  def self.current
    year = Date.today.year
    Date.today.month < 6 ? year - 1 : year
  end
end
