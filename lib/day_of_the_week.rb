require 'csv'
require 'time'

def get_reg_day_name(reg_date)
  reg_day_name = Time.strptime(reg_date, "%m/%d/%y %k:%M").strftime("%A") # %a for abbreviated name
end

puts "Assignment: Day of the Week"

contents = CSV.open(
  'event_attendees.csv', # can switch to full csv
  headers: true,
  header_converters: :symbol
)

result = contents.each_with_object(Hash.new(0)) do |row, hash|
  name = row[:first_name]
  reg_day_name = get_reg_day_name(row[:regdate])

  puts "#{name}: #{reg_day_name}"

  hash[reg_day_name] += 1
  hash.sort_by {|k,v| v}.reverse.to_h # In descending order
end

p result
