require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  def setup
    @budget = Budget.new(hours: 100, start_date: '2020-02-20', end_date: '2020-10-20', employer: employers(:one))
  end

  test "should be valid" do
  	assert @budget.valid?
  end
  
  test "hours present" do
    @budget.hours = nil
    assert_not @budget.valid?
  end
  
  test "employer present" do
  	@budget.employer = nil
  	assert_not @budget.valid?
  end
  
  test "start date present" do
  	@budget.start_date = nil
  	assert_not @budget.valid?
  end
  
  test "end date present" do
  	@budget.end_date = nil
  	assert_not @budget.valid?
  end
end