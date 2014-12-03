require_dependency 'projects_helper'

module ProjectHierarchyPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      alias_method_chain :render_project_hierarchy, :color
    end
  end

  module InstanceMethods
    def render_project_hierarchy_with_color(projects)
      render_project_nested_lists(projects) do |project|
        project_safe = project.identifier.downcase.tr(" ","_")
        s = link_to_project(project, {}, :class => "#{project.css_classes} #{Setting.plugin_project_colors[project_safe]}  #{User.current.member_of?(project) ? 'my-project' : nil}")
        if project.description.present?
          s << content_tag('div', textilizable(project.short_description, :project => project), :class => 'wiki description')
        end
        s
      end
    end
  end
end


ProjectsHelper.send(:include, ProjectHierarchyPatch)
