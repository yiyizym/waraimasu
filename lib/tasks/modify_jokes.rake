# useage: RAILS_ENV=development rails data:modify filename=modify.json
namespace :data do
  desc "modify data from json files to database"
  task :modify => :environment do
    file = File.open("#{Rails.root.join('lib', 'tasks', 'modify.log')}", File::WRONLY | File::APPEND)
    logger = Logger.new(file)
    logger.debug "using file #{ENV['filename']} to modify"
    p "using file  #{ENV['filename']} to modify"
    require 'json'
    total_modified = 0
    modified_ids = []
    File.open Rails.root.join('lib', 'tasks', "#{ENV['filename']}"),"r" do |file|
        data_array = JSON.parse(file.read)
        logger.debug "#{ENV['filename']} has #{data_array.length} items"
        data_array.each do |obj|
            joke = Joke.find_by(id: obj['id'])
            next unless joke.present?

            joke.content = obj['content']
            if joke.save
                total_modified = total_modified + 1
                modified_ids.push(joke.id)
            end

        end
        logger.debug "modify jokes by file: #{ENV['filename']} successfully"
        logger.debug "modify #{total_modified} jokes"
        logger.debug "modified jokes id: #{modified_ids}"
    end
  end
end