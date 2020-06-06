require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = Employee.new(first_name: "Paul", last_name: "House", employer: employers(:one))
  end

  test "should be valid" do
    assert @employee.valid?
  end
  
  test "employer presence" do
    @employee.employer = nil
    assert_not @employee.valid?
  end
  
  test "first name should be present" do
    @employee.first_name = ""
    assert_not @employee.valid?
  end

  test "last name should be present" do
    @employee.last_name = ""
    assert_not @employee.valid?
  end

  test "first name should only contain letters" do
    @employee.first_name = "paul1"
    assert_not @employee.valid?
  end

  test "last name should only contain letters" do
    @employee.last_name = "paul1"
    assert_not @employee.valid?
  end
end
