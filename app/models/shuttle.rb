class Shuttle < ActiveRecord::Base
  default_scope :order => 'departure_time ASC'
  
  has_many :users, :dependent => :nullify

  validates :departure_time, :presence => true
  validates :capacity, :presence => true
  validates :destination, :presence => true

  # Inefficient
  def num_people
    @num ||= self.users.count
  end

  def is_full?
    self.num_people > self.capacity
  end


  def long_date
    self.departure_time.strftime("%A, %B %d, %l:%M%p") 
  end

  def day_of_week
    self.departure_time.strftime("%A, %B %d")
  end

  def short_time
    self.departure_time.strftime("%l:%M%p") 
  end
end
