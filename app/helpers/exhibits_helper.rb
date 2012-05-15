require_relative '../exhibits/exhibit'

module ExhibitsHelper

  def exhibit(model,context)
    Exhibit.exhibit(model, context)
  end

  def to_model
    __getobj__
  end

  def class
    __getobj__.class
  end

end
