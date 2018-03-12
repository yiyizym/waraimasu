# useage: RAILS_ENV=development rails holidays:import filename=holidays.yml
namespace :holidays do
  desc "import holidays from yaml files to database"
  task :import => :environment do
    filename = ENV['filename'] || 'holidays.yml'
    file = File.open("#{Rails.root.join('lib', 'tasks', 'import_holidays.log')}", File::WRONLY | File::APPEND)
    logger = Logger.new(file)
    logger.debug "importing file #{filename}"
    p "Importing file  #{filename}"
    holidays = YAML.load_file(Rails.root.join('lib', 'tasks', "#{filename}"))
    logger.debug "#{filename} has #{holidays.length} items"
    holidays.each do |key, val|
      p "key #{key} "
      p "val #{val} "
      Holiday.create({
        date: key,
        holiday: val
    })
    end
    logger.debug "#{filename} import successfully"
  end
end