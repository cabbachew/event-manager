require 'csv'
require 'time'

def get_reg_hour(reg_date)
  reg_hour = Time.strptime(reg_date, "%m/%d/%y %k:%M").hour # OR strftime("%l %p").strip
end

puts "Assignment: Time Targeting"

contents = CSV.open(
  'event_attendees.csv', # can switch to full csv
  headers: true,
  header_converters: :symbol
)

contents.each_with_object(Hash.new(0)) do |row, hash|
  name = row[:first_name]
  reg_hour = get_reg_hour(row[:regdate])

  puts "#{name}: #{reg_hour}"

  hash[reg_hour] += 1
  p hash.sort_by {|k,v| v}.reverse.to_h # In descending order
end