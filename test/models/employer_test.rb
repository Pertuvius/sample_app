require 'test_helper'

class EmployerTest < ActiveSupport::TestCase


  def setup
    @employer = Employer.new(first_name: "Paul", last_name: "Wilson")
  end
  
  test "should be valid" do
    assert @employer.valid?
  end


  test "first name should be present" do
    @employer.first_name = ""
    assert_not @employer.valid?
  end

  test "last name should be present" do
    @employer.last_name = ""
    assert_not @employer.valid?
  end

end