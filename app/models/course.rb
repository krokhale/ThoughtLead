class Course < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user
  alias_attribute :to_s, :title
  
end
