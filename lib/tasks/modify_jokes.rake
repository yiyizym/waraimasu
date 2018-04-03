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
    not_modified = 0
    modified_ids = []
    not_modified_ids = []
    File.open Rails.root.join('lib', 'tasks', "#{ENV['filename']}"),"r" do |file|
        data_array = JSON.parse(file.read)
        logger.debug "#{ENV['filename']} has #{data_array.length} items"
        jokes = Joke.all
        data_array.each do |obj|
            match_content = obj['content'][0,5]
            joke = jokes.where(["content REGEXP ?", "^\s?#{match_content}"])
            unless (joke.present? && joke.size == 1)
		not_modified = not_modified + 1
                not_modified_ids.push(obj['id'])
		next
	    end
            joke.first.content = obj['content']
	    if joke.first.save
		total_modified = total_modified + 1
        	modified_ids.push(joke.first.id)
            else
		not_modified = not_modified + 1
                not_modified_ids.push(obj['id'])
		next
            end
        end
        logger.debug "modify #{total_modified} jokes"
        logger.debug "modified jokes id: #{modified_ids}"
        logger.debug "not modified #{not_modified} jokes"
        logger.debug "not modified jokes id: #{not_modified_ids}"
    end
  end
end
