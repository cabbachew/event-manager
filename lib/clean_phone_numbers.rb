require 'csv'

def clean_phone_number(homephone)
  numbers_only = homephone.gsub(/[^\d]/, "") # Remove nonnumerical chars
  if numbers_only.length == 10
    numbers_only
  elsif numbers_only.length == 11 && numbers_only[0] == "1"
    numbers_only[1..11]
  else
    "No valid phone number"
  end
end

puts "Assignment: Clean Phone Numbers"

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  phone_number = clean_phone_number(row[:homephone])

  puts "#{name}: #{phone_number}"
end