class ProductBacklog < ActiveRecord::Base
  unloadable

  validates_presence_of :content
end
