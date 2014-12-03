# -*- encoding : utf-8 -*-
if Rails.version.to_f >= 3.0
  get '/spent_time/update_project_issues' => 'spent_time#update_project_issues', :as => 'update_project_issues_spent_time'
  get '/spent_time/create_entry' => 'spent_time#create_entry', :as => 'create_entry_spent_time'
  get '/spent_time/update_entry' => 'spent_time#update_entry', :as => 'update_entry_spent_time' 
  get '/spent_time/destroy_entry' => 'spent_time#destroy_entry', :as => 'destroy_entry_spent_time'  
  get '/spent_time/report' => 'spent_time#report', :as => 'report_spent_time'  
  get '/spent_time' => 'spent_time#index', :as => 'index_spent_time'
else
  ActionController::Routing::Routes.draw do |map|
    map.connect '/spent_time/update_project_issues', :controller => 'spent_time', :action => 'update_project_issues'
    map.connect '/spent_time/create_entry', :controller => 'spent_time', :action => 'create_entry'
    map.connect '/spent_time/update_entry', :controller => 'spent_time', :action => 'update_entry'
    map.connect '/spent_time/destroy_entry', :controller => 'spent_time', :action => 'destroy_entry'  
    map.connect '/spent_time/report', :controller => 'spent_time', :action => 'report'  
    map.connect '/spent_time', :controller => 'spent_time', :action => 'index'
  end
end
