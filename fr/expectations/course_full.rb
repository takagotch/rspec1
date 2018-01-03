course = Course.new(:seats => 20)
20.times { course.register Student.new }
lambda {
  course.register Student.new
}.should throw_symbol(:cuorse_full, 20)

