namespace :posts do
  desc "Update all users"
  task :update => :environment do
    Post.find_each do |post|
      # Thực hiện các thao tác bạn muốn với đối tượng User ở đây
      post.save
    end
    puts "Done!!!"
  end
end
