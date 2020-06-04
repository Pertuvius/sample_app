class Employee < ApplicationRecord
  belongs_to :employer
  validates_presence_of :employer
	has_many :timesheets, dependent: :destroy
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
end
