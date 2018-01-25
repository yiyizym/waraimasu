namespace :data do
  desc "import data from json files to database"
  task :import => :environment do
    p "Importing file  #{ENV['filename']}"
    require 'json'
    File.open Rails.root.join('lib', 'tasks', "#{ENV['filename']}"),"r" do |file|
        data_array = JSON.parse(file.read)
        data_array.each do |obj|
          Joke.create({content: obj['content']}) if obj['content'].present?
        end
    end
  end
end