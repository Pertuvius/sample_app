json.extract! timesheet, :id, :user, :clock, :time, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
