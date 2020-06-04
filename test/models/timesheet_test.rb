require 'test_helper'

class TimesheetTest < ActiveSupport::TestCase
 
  def setup
    @timesheet = Timesheet.new(employee: employees(:one), hours: 1, date_of_service: '2020-05-15', budget: budgets(:one))
  end
  
  test "should be valid" do
  	assert @timesheet.valid?
  end
  
  test "hours present" do
  	@timesheet.hours = nil
  	assert_not @timesheet.valid?
  end
  
  test "date of service present" do
  	@timesheet.date_of_service = nil
  	assert_not @timesheet.valid?
  end
  
  test "budget present" do
  	@timesheet.budget = nil
  	assert_not @timesheet.valid?
  end
  
  test "employee present" do
  	@timesheet.employee = nil
  	assert_not @timesheet.valid?
  end
  
  test "date of service between budget dates" do
  	@timesheet.date_of_service = @timesheet.budget.end_date + 1.day 
  	assert_not @timesheet.valid?
  end
  
  test "hours within budget hours" do
  	@timesheet.hours = 3
  	assert_not @timesheet.valid?
  end
  
  test "budget matches employer" do
    @timesheet.employee.employer = employers(:two)
    assert_not @timesheet.valid?
  end
end