class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :questions, through: :survey

  scope :complete, ->{ where("completed_at is not null") }

  def self.ransackable_attributes(auth_object = nil)
    ["assigned_at", "completed_at", "created_at", "deadline_at", "id", "id_value", "survey_id", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["survey", "user"]
  end

end
