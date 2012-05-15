require 'date'
require 'active_record'

class Post < ActiveRecord::Base
  before_validation :set_default_body
  validates :title, presence: true
  attr_accessor :blog
  def picture?
    image_url.present?
  end
  def publish(clock=DateTime)
    return false unless valid?
    self.pubdate = clock.now
    blog.add_entry(self)
  end

  private

  def set_default_body
    if body.blank?
      self.body = 'Nothing to see here'
    end
  end

end

class Person
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates_presence_of :name

  attr_accessor :name

  def initialize(attributes = {})
    @name = attributes[:name]
    
  end

  
end
