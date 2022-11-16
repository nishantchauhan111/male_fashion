namespace :test do 
    desc "welcome user"

    task welcom_user_massage: :environment do 
        puts "hello user    "
    end
    
end