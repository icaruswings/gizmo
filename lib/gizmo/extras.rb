# make OpenStruct yield to a block.
def OpenStruct
  open_struct = OpenStruct.new
  yield open_struct if block_given?
  open_struct
end

class Module
  def extended base
    base.extended_with(self) if base.respond_to?(:extended_with)
  end
end