describe ProjectsController do
  get :index do
    should_render "index"
    should_assign :project => [Project, :all]
  end
end

