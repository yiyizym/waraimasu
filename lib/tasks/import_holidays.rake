# useage: RAILS_ENV=development rails holidays:import filename=holidays.yml
namespace :holidays do
  desc "import holidays from yaml files to database"
  task :import => :environment do
    filename = ENV['filename'] || 'holidays.yml'
    file = File.open("#{Rails.root.join('lib', 'tasks', 'import.log')}", File::WRONLY | File::APPEND)
    logger = Logger.new(file)
    logger.debug "importing file #{filename}"
    p "Importing file  #{filename}"
    require 'YAML'
    holidays = YAML.load_file(Rails.root.join('lib', 'tasks', "#{filename}"))
    # logger.debug "#{filename} has #{data_array.length} items"
    # data_array.each do |obj|
    #   Joke.create({content: obj['content']}) if obj['content'].present?
    # end
    # logger.debug "#{filename} import successfully"
  end
end