#a task related to database
namespace :db do
	desc "Fill database with sample data"
	task populateprod: :environment do 
		10.times do |n|
			puts "[DEBUG] creating user #{n+1} of 10"
			name = Faker::Name.name
			email = "user-#{n+1}@example.com"
			password = "foobar"
			User.create!( name: name, 
										email: email, 
										password: password,
										password_confirmation: password )
		end

		User.all.each do |user|
			puts "[DEBUG] uploading images for user #{user.id} of #{User.last.id}"

			10.times do |n|
				#getting images from Amazon S3 to populate the application on heroku
				image = URI.parse(ENV['AWS_OMRAILS_SAMPLE_IMAGES']+%w(Car1.jpg Car2.jpg Paris1.jpg Paris2.jpg Paris3.jpg Paris4.jpg Paris5.jpg doggy1.jpg doggy2.jpg doggy3.jpg).sample)
				description = %w(cool awesome crazy wow adorable incredible cute).sample
				user.pins.create!(image: image, description: description)
			end
		end
	end
end