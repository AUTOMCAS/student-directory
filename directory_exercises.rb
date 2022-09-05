def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(list)
  list.each_with_index do |student, idx|
    puts student.to_s.center(100, "***")
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  
  while !name.empty? do  
    puts "Please enter the hobby of the student"
    hobby = gets.chomp
    puts "Please enter the height of the student"
    height = gets.chomp
    puts "Please enter the cohort of the student"
    cohort = gets.chomp
    cohort = :november if cohort.empty?
   
    until  datecheck(cohort) == true
      puts "Please check your spelling for cohort month"
      cohort = gets.chomp  
    end

    students << {name: name, hobby: hobby, height: height, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def datecheck(month)
  require "date"
  Date::MONTHNAMES.include?(month.capitalize)
end


students = input_students
print_header
print(students)
print_footer(students)
