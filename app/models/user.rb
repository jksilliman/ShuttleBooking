class User < ActiveRecord::Base
  belongs_to :shuttle 
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable, :omniauthable, :registerable, :validatable, :recoverable

  devise :ldap_authenticatable, :rememberable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :first_name, :last_name, :phone_number, :division, :shuttle_id, :password 
  attr_accessible :username, :is_admin, :as => :admin

  
  validate :shuttle_not_full
  validates_associated :shuttle, :if => :on_shuttle_form
  validates_presence_of :first_name, :last_name, :phone_number, :division, :shuttle_id, :if => :on_shuttle_form



  def shuttle_not_full
    if self.shuttle_id_changed? and self.shuttle.is_full?
      errors.add(:shuttle_id, "This shuttle is full. Please choose a different shuttle.")
    end
  end

  def on_shuttle_form
    @on_form ||= false
  end

  def on_shuttle_form=(val)
    @on_form = val
  end





  validate :is_in_ldap
  def is_in_ldap
    print "TEST5"
    unless Devise::LdapAdapter.get_ldap_param(self.username,"uid")
      errors.add(:username, "is not a valid CNetID")
    end
  end

  before_save :get_ldap_email
  def get_ldap_email
    print "TEST6" 
    self.email = unwrap(Devise::LdapAdapter.get_ldap_param(self.username,"mail"))
  end

  def name
    unless self.first_name.blank? and self.last_name.blank? 
      self.first_name + " " + self.last_name
    else
      self.username
    end
  end

  private
  def unwrap(arr)
    (arr.kind_of?(Array)) ? arr.first : arr
  end


end
