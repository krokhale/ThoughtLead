class Theme < ActiveRecord::Base
  belongs_to :community
  validates_presence_of :name, :description
  has_many :discussions, :dependent => :nullify
  
  alias_attribute :to_s, :name
  
end