class Module
  def extended base
    base.extended_with(self) if base.respond_to?(:extended_with)
  end
end