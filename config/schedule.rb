every :hour do
    rake "todo:delete_items"
    rake 'todo:delete_empty_lists'
end

every :reboot do
  rake 'todo:delete_items'
  rake 'todo:delete_empty_lists'
end