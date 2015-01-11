class CourseController < ApplicationController
  def eval
      @criteria = { "Participation" => 5, "Homework" => 45, "Exams" => 50}
  end

  def announce
      @study_date = Date.new(2015, 2, 1);
  end

  def scores
      redirect_to course_announce_path, notice: 'No scores available yet'
  end
end
