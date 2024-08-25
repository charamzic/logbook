namespace :db do
  desc "Assign a default user to vehicles without a user"
  task assign_default_user: :environment do
    default_user = User.find_by(email: "charamza@gmail.com")

    Vehicle.where(user_id: nil).find_each do |vehicle|
      vehicle.update(user_id: default_user.id)
    end

    Trip.where(user_id: nil).find_each do |trip|
      trip.update(user_id: default_user.id)
    end

    puts "Orphaned records have been assigned to the default user."
  end
end
