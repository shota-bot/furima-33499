crumb :root do
  link "トップページ", root_path
end

crumb :user do |user|
  link "マイページ", user_path
  parent :root
end

crumb :item do |item|
  link item.name, item_path
  parent :root
end

crumb :edit_item do |item|
  link "編集", edit_item_path
  parent :item, item
end

crumb :search_item do |item|
  link "詳細検索", search_items_path
  parent :root
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).