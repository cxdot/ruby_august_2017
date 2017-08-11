class StudentsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:id])
    @students = Student.joins(:dojo).where("dojos.id = ?", params[:id]).select("students.id as student_id, dojos.id as dojo_id, first_name, last_name, email")
  end

  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:id])
  end

  def new_student
    @student = Student.new(student_params)

    if @student.save
      redirect_to "/dojo/#{@student.dojo_id}", notice: "You have successfully created a student!"
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @student = Student.find(params[:id])
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])

  end

  def edit_student
    @student = Student.find(params[:id]).update(student_params)
    @dojo = Dojo.find(params[:dojo_id])

    redirect_to "/dojo/#{@dojo.id}", notice: "You have successfully updated a student!"
  end

  def show
  end

  def remove
    Student.find(params[:id]).destroy
    redirect_to :back
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
