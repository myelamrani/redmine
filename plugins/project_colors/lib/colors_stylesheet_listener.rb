class ColorStylesheetListener < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context={})
    stylesheet_link_tag 'colors', :plugin => 'project_colors'
  end
end
