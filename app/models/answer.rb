class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :assignment
  has_one :survey, through: :assignment
end
