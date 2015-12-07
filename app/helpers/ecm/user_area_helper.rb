module Ecm::UserAreaHelper
  def render_user_navigation(*args)
    options = args.extract_options!
    options.reverse_merge!(dropdown: false)
    dropdown = options.delete(:dropdown)

    if dropdown
      render partial: 'ecm/user_area/navigation_dropdown'
    else
      render partial: 'ecm/user_area/navigation'
    end
  end
end
