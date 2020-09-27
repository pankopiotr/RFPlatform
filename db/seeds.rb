categories = [Category.create(name: 'Category1'), Category.create(name: 'Category2')]

courses = (1...10).map do |x|
  Course.create(name: "Course#{x}", category: categories.sample)
end

training_modules = (1...100).map do |x|
  number_of_courses = rand(2) + 1
  TrainingModule.create(name: "TrainingModule#{x}", courses: courses.sample(number_of_courses))
end

1000.times do |x|
  TrainingModuleActivity.create(activity_name: 'execute', training_module: training_modules.sample)
end
