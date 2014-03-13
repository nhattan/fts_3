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

subject_list = {
  "Rails" => "Learn about rails",
  "Git" => "Learn about git",
  "MySQL" => "Learn about MySQL",
  "POSGRESQL" => "Learn about POSGRESQL",
  "iOS" => "Learn about iOS",
  "AdvancedGit" => "Learn about advanced git"
}

subject_list.each do |name, description|
  Subject.create(name: name, description: description)
end

(1..4).each do |i|
  CourseSubject.create(course_id: 1, subject_id: i)
end

(3..6).each do |i|
  CourseSubject.create(course_id: 2, subject_id: i)
end

task_list = {
  "Chapter1" => "Content for chapter1",
  "Chapter2" => "Content for chapter2",
  "Exam" => "Content for exam"
}

task_list.each do |name, description|
  (1..6).each do |i|
    Task.create(subject_id: i, name: name, description: description)
  end
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