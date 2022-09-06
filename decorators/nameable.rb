class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented this method"
  end
end
