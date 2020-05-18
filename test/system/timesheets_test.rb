require "application_system_test_case"

class TimesheetsTest < ApplicationSystemTestCase
  setup do
    @timesheet = timesheets(:one)
  end

  test "visiting the index" do
    visit timesheets_url
    assert_selector "h1", text: "Timesheets"
  end

  test "creating a Timesheet" do
    visit timesheets_url
    click_on "New Timesheet"

    fill_in "Clock", with: @timesheet.clock
    fill_in "Time", with: @timesheet.time
    fill_in "User", with: @timesheet.user
    click_on "Create Timesheet"

    assert_text "Timesheet was successfully created"
    click_on "Back"
  end

  test "updating a Timesheet" do
    visit timesheets_url
    click_on "Edit", match: :first

    fill_in "Clock", with: @timesheet.clock
    fill_in "Time", with: @timesheet.time
    fill_in "User", with: @timesheet.user
    click_on "Update Timesheet"

    assert_text "Timesheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Timesheet" do
    visit timesheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timesheet was successfully destroyed"
  end
end
