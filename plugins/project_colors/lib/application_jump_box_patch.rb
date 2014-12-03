require_dependency 'application_helper'

module ApplicationJumpBoxPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      alias_method_chain :project_tree_options_for_select, :color
    end
  end

  module InstanceMethods
    def project_tree_options_for_select_with_color(projects, options = {})
      s = ''
      project_tree(projects) do |project, level|
        name_prefix = (level > 0 ? '&nbsp;' * 2 * level + '&#187; ' : '').html_safe
        tag_options = {:value => project.id}
        project_safe = project.identifier.downcase.tr(" ","_")
        tag_options[:class] = Setting.plugin_project_colors[project_safe]
        if project == options[:selected] || (options[:selected].respond_to?(:include?) && options[:selected].include?(project))
          tag_options[:selected] = 'selected'
        else
          tag_options[:selected] = nil
        end
        tag_options.merge!(yield(project)) if block_given?
        s << content_tag('option', name_prefix + h(project), tag_options)
      end
      s.html_safe
    end
  end
end


ApplicationHelper.send(:include, ApplicationJumpBoxPatch)
