class Question < ApplicationRecord
  belongs_to :survey
  # has_many :assignments, through: :survey



  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "content", "updated_at", "position"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["survey"]
  end

end
