class ProblemsController < ApplicationController
  def index
    @problems = Problem.sort_by_date
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
    @problem = Problem.find_by_id(params[:id])
  end

  def rating
    @problems = Problem.sort_by_rating
  end

  def easiest
    @problems = Problem.sort_by_grade.reverse
  end

  def hardest
    @problems = Problem.sort_by_grade
  end

  def grades
    @problems = Problem.filter_by_grades(min, max)
  end

  def styles
    @problems = Problem.filter_by_style(selected_style)
  end

  def walls
    @problems = Problem.filter_by_wall(selected_wall)
  end
 
  private

  def problem_params
    params.require(:problem).permit(:wall_id, :name, :color, :grade, :image, style_ids:[])
  end
end
