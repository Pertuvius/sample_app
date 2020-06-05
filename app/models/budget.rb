class Budget < ApplicationRecord
  belongs_to :employer
  has_many :timesheets, dependent: :destroy

  validates :employer_id, presence: true
  validates :hours, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
