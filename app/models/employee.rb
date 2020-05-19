class Employee < ApplicationRecord
  belongs_to :employer
  validates_presence_of :employer
	has_many :timesheets
end
