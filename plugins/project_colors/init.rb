require_dependency 'colors_stylesheet_listener'
require_dependency 'application_jump_box_patch'
require_dependency 'application_project_hierarchy_patch'

Redmine::Plugin.register :project_colors do
  name 'Project Colors plugin'
  author 'Manuel Padron Martinez'
  description 'Put some color in your projects'
  version '0.0.3'
  url 'https://gitlab.graph-ic.org/manolopm/project_colors'
  author_url 'https://twitter.com/manolopm'
  settings :default => {'empty' => true}, :partial => 'settings/project_colors_settings'
end
