json.extract! timesheet, :id, :employee, :hours, :time, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
