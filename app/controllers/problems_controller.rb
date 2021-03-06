class ProblemsController < ApplicationController
  before_action :require_login

  def index
    @problems = Problem.sort_by_date
  end
  
  def new
    @problem = Problem.new
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.points = @problem.convert_grade_to_int

    if @problem.save
      redirect_to problems_path
    else
      # @problem is now full of error messages
      # re-rendered :new page knows how to display errors alongside user's enries
      render :new
    end
  end

  def show
    @problem = Problem.find_by_id(params[:id])
    if !@problem
      flash[:alert] = "Problem doesn't exit."
      redirect_to problems_path
    end
  end

  def easiest
    @problems = Problem.sort_by_grade.reverse
    render :index
  end

  def hardest
    @problems = Problem.sort_by_grade
    render :index
  end

  def grades
    @problems = Problem.filter_by_grades(min, max)
    render :index
  end

  def styles
    @problems = Problem.filter_by_style(selected_style)
    render :index
  end

  def walls
    @problems = Problem.filter_by_wall(selected_wall)
    render :index
  end
 
  private

  def problem_params
    params.require(:problem).permit(:wall_id, :name, :color, :grade, :image, style_ids:[])
  end
end
