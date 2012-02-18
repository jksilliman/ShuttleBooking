class SiteContent < ActiveRecord::Base
  def self.get(name)
    SiteContent.find_or_create_by_name(name).try(:text) || ""
  end
end
