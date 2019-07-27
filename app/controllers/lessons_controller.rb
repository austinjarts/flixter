class LessonsController < ApplicationController
  before_action :authenticate_user!
 

  def show
  end 

  
private

  def require_enrollment_for_current_course
    if current_user.enrolled_in?(@course) != current_user
      redirect_to courses_path, alert: 'Must be enrolled to view lesson'

    end
  end 

  helper_method :current_course 
  def current_course
    @current_course ||= Course.find(params[:course_id])
  end 

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end 



end
