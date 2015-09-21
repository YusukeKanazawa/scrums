Redmine::Plugin.register :scrums do
  name 'Scrums plugin'
  author 'Yusuke Kanazawa'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://angelic-angel.com/plugin'
  author_url 'angelic-angel.com'
  project_module :scrums do
    permission :view_scrums, :product_backlogs => [:index, :show]
    permission :manage_scrums, :product_backlogs => [:new, :edit, :create, :update, :destroy, :preview], :require => :member
  end
  menu :project_menu, :product_backlogs, { :controller => 'product_backlogs', :action => 'index' }, :param => :project_id
  menu :project_menu, :task_board, { :controller => 'product_backlogs', :action => 'index' }, :param => :project_id
end
