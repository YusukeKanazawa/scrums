class ProductBacklogsController < ApplicationController
  unloadable
  menu_item :scrums
  before_filter :find_project, :authorize

  def index
    @product_backlogs = ProductBacklog.where(project_id: @project.id).all
  end

  def new
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
