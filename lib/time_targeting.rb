require 'csv'
puts "Assignment: Time Targeting"

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  reg_date = row[:regdate]

  puts "#{name}: #{reg_date}"
end