namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
     Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end
  
  task delete_empty_lists: :environment do
    List.all.each do |list|
      list.destroy if (list.number_of_items == 0)
    end
  end
end
