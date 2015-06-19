class Season
  def self.current
    year = Date.today.year
    Date.today.month < 6 ? year - 1 : year
  end

  def self.list
    current = self.current
    {
      "Current season (#{self.new(current)})" => current,
      "Previous season (#{self.new(current-1)})" => current-1
    }
  end


  def initialize(year=nil)
    @year = year || self.class.current
  end

  def to_s
    "#{@year}/#{(@year+1).to_s[2,3]}"
  end

  def first_half?
    Date.today.month >= 6
  end

  def second_half?
    Date.today.month < 6
  end

end
