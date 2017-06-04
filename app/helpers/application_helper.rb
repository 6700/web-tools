module ApplicationHelper
  def active_link_to(*args)
    link_to_unless_current(args) do
      
    end
  end
end
