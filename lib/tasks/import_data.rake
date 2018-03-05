# useage: RAILS_ENV=development rails data:import filename=data.json
namespace :data do
  desc "import data from json files to database"
  task :import => :environment do
    file = File.open("#{Rails.root.join('lib', 'tasks', 'import.log')}", File::WRONLY | File::APPEND)
    logger = Logger.new(file)
    logger.debug "importing file #{ENV['filename']}"
    p "Importing file  #{ENV['filename']}"
    require 'json'
    File.open Rails.root.join('lib', 'tasks', "#{ENV['filename']}"),"r" do |file|
        data_array = JSON.parse(file.read)
        logger.debug "#{ENV['filename']} has #{data_array.length} items"
        data_array.each do |obj|
          Joke.create({content: obj['content']}) if obj['content'].present?
        end
        logger.debug "#{ENV['filename']} import successfully"
    end
  end
end