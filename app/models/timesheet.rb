class Timesheet < ApplicationRecord
  attr_accessor :month, :day, :year
	belongs_to :employee
	belongs_to :budget
	
	validates :employee_id, presence: true
	validates :budget_id, presence: true
	validates :hours, presence: true, numericality: true
	validates :date_of_service, presence: true
	validate  :date_of_service_between_budget_dates
  validate  :hours_within_budget_hours
  validate  :budget_matches_employer
  
  def budget_matches_employer
  	unless employee && budget && employee.employer == budget.employer
  		self.errors[:budget] << "not matching employer!"
  	end
  end

  def hours_within_budget_hours
  	if hours && budget && budget.timesheets.sum(&:hours) + hours > budget.hours
  		self.errors[:hours] << "not within budget hours!"
  	end
  end

  def date_of_service_between_budget_dates
  	unless date_of_service && budget && date_of_service.between?(budget.start_date, budget.end_date)
  		self.errors[:date_of_service] << 'not between budget dates!'
  	end
  end
end   
