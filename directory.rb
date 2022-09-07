@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts menu_list["1"]
    students = input_students
  when "2"
    puts menu_list["2"]
    show_students
  when "3"
    puts menu_list["3"]
    save_students
  when "4"
    puts menu_list["4"]
    load_students
  when "9"
    puts menu_list["9"]
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  menu_list.each_value do |value|
    puts value
  end
  puts "\n"
end

def menu_list
  menu = { 
    "1" => "1. Input the students",
    "2" => "2. Show the students",
    "3" => "3. Save the list to students.csv",
    "4" => "4. Load list from students.csv",
    "9" => "9. Exit"
  }
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts "\n"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    push_student_info(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    file.puts [student[:name], student[:cohort]].join(", ")
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    push_student_info(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students 
    return
  end
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

def push_student_info(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu