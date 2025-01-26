class Survey < ApplicationRecord

  has_many :questions

  accepts_nested_attributes_for :questions, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["questions"]
  end
end
