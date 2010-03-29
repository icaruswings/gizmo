# make OpenStruct yield to a block.
def OpenStruct
  open_struct = OpenStruct.new
  yield open_struct if block_given?
  open_struct
end