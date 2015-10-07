class ProductBacklogsController < ApplicationController
  unloadable
  menu_item :scrums
  before_filter :find_project, :authorize

  def index
    @product_backlog_tracker = Tracker.find_by!(name: 'product_backlog')
    @sprints = Version.where(project_id: @project.id).all
    @product_backlogs = Issue.where(project_id: @project.id,
      tracker_id: @product_backlog_tracker.id).group_by(&:fixed_version_id)
  end

  def new
    @issue = Issue.new()
  end

  def create
    @issue = Issue.new(params.require(:issue).permit(:subject))

    if @issue.save
      flash[:notice] = l(:notice_successful_create)
      redirect_to project_product_backlog_path(@project)
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
