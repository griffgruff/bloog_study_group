require 'delegate'

class Exhibit < SimpleDelegator
  def initialize(model, context)
    @context = context
    super(model)
  end

  def self.exhibit(object, context)
    exhibits.inject(object) do |object, exhibit_class|
      exhibit_class.exhibit_if_applicable(object, context)
    end

    #self.exhibits.each do |exhibit|
    #  return exhibit.new(object, context) if exhibit.applicable_to?(object) 
    #end
  end
  
  def self.exhibit_if_applicable(object, context)
    if applicable_to?(object)
      new(object, context)   #what does this new up? a new class of the current type
    else
      object
    end
  end
      
  def self.applicable_to?(object)
    false
  end

  def self.exhibits
    [PicturePostExhibit, TextPostExhibit, LinkExhibit ]
  end

end
