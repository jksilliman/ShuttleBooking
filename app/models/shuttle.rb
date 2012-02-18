class Shuttle < ActiveRecord::Base
  default_scope :order => 'departure_time ASC'
  
  has_many :users, :dependent => :nullify

  validates :departure_time, :presence => true
  validates :capacity, :presence => true

  # Inefficient
  def num_people
    @num ||= self.users.count
  end

  def is_full?
    self.num_people > self.capacity
  end
end
