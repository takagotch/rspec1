module ApplicationHelper
  def display_for(role)
	  yeild if current_user.in_role?(role)
  end
end

