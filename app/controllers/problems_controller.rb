class ProblemsController < ApplicationController
  def index
    @problems = Problem.problems_by_date
  end
  
  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to problems_path
    else
      render :new
    end
  end

  def show
  end

  private

  def problem_params
    # params.require(:problem).permit(:wall_id, :name, :color, :grade, :image, :style_ids:[])
  end
end
