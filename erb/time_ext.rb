class Integer
  def hour
    self * 3600
  end
  def from_now
    Time::now + self
  end
end

def h(string)
  string
end