# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Admin", email: "admin@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 1)

(1..30).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", supervisor: 0)
end

course_list = {
  "Internship" => "This is a course for Internship",
  "Trainee" => "This is a course for Trainee"
}

course_list.each do |name, description|
  Course.create(name: name, description: description)
end

subject_list1 = {
  "Rails" => "Learn about rails",
  "Git" => "Learn about git",
  "MySQL" => "Learn about MySQL"
}

subject_list1.each do |name, description|
  Subject.create(course_id: 1, name: name, description: description)
end

subject_list2 = {
  "iOS" => "Learn about iOS",
  "AdvancedGit" => "Learn about advanced git",
  "POSGRESQL" => "Learn about POSGRESQL"
}

subject_list2.each do |name, description|
  Subject.create(course_id: 2, name: name, description: description)
end

task_list = {
  "Chapter1" => "Content for chapter1",
  "Chapter2" => "Content for chapter2",
  "Exam" => "Content for exam"
}

task_list.each do |name, description|
  Task.create(subject_id: 1, name: name, description: description)
  Task.create(subject_id: 2, name: name, description: description)
  Task.create(subject_id: 3, name: name, description: description)
  Task.create(subject_id: 4, name: name, description: description)
  Task.create(subject_id: 5, name: name, description: description)
  Task.create(subject_id: 6, name: name, description: description)
end

(2..10).each do |i|
  UserCourse.create(user_id: i, course_id: 1, finish: 0)

  (1..3).each do |j|
    UserSubject.create(user_id: i, subject_id: j, finish: 1)
  end

  (1..3).each do |j|
    UserTask.create(user_id: i, task_id: j, finish: 1)
  end
end

(11..20).each do |i|
  UserCourse.create(user_id: i, course_id: 2, finish: 0)

  (1..3).each do |j|
    UserSubject.create(user_id: i, subject_id: j, finish: 1)
  end

  (1..3).each do |j|
    UserTask.create(user_id: i, task_id: j, finish: 1)
  end
end

report = {
  "Report1" => "Content for report1",
  "Report2" => "Content for report2",
  "Report2" => "Content for report2"
}

report.each do |title, content|
  (2..10).each do |i|
    Report.create(user_id: i, title: title, content: content)
  end
end