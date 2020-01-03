class Array
  def sample!
    delete_at(rand(length))
  end
end