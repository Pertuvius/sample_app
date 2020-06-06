class Budget < ApplicationRecord
  belongs_to :employer
  has_many :timesheets, dependent: :destroy

  validates :employer_id, presence: true
  validates :hours, presence: true, numericality: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate  :start_date_before_end_date

  def start_date_before_end_date
    unless start_date && end_date && start_date <= end_date
      self.errors[:start_date] << "must be before end date!"
    end
  end
end
