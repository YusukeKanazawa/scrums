class ProductBacklogsController < ApplicationController
  unloadable
  menu_item :scrums
  before_filter :find_project, :authorize

  def index
    @product_backlogs = ProductBacklog.where(project_id: @project.id).all
  end

  def new
    @product_backlog = ProductBacklog.new()
  end

  def create
    @product_backlog = ProductBacklog.new(params.require(:product_backlog).permit(:content))
    @product_backlog.project_id = @project.id
    @product_backlog.status = 0
    @product_backlog.priority = -1
    @product_backlog.estimate = 0.0
    
    if @product_backlog.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to project_product_backlog_path(@project, @product_backlog.id)
    end
  end 

  def show
  end

  def edit
  end

private
  def find_project
    @project = Project.find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
