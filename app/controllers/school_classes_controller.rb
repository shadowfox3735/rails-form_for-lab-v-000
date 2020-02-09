class SchoolClassesController < ApplicationController
  def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
	  @student = Student.new(student_params(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student)
	end

	def update
	  @student = Student.find(params[:id])
    @student.update(school_class_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

	def edit
	  @student = Student.find(params[:id])
	end
	
	private
 
  def school_class_params(*args)
    params.require(:school_class).permit(*args)
  end
end