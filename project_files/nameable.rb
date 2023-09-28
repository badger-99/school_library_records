class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{_method_}'"
  end
end
