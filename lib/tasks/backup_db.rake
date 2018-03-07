#usage RAILS_ENV=env rake server_db:backup
namespace :server_db do
  REPO_DIR = Rails.root.join(__FILE__, '../../../tmp/db_backup')

  desc 'Backup DB and commit into Github repo'
  task :backup do
    if !Dir.exist?(REPO_DIR)
      p "REPO_DIR not exist"
      return
      # `git clone git@github.com:lllukom/myproject-backup.git #{REPO_DIR}`
    end

    opts = '--skip-extended-insert --skip-dump-date --lock-tables=false'
    mysql_cmd "mysqldump %{credentials} #{opts} %{database} > #{REPO_DIR}/db.sql"

    # `cd #{REPO_DIR} && git add -A && git commit -m 'daily backup' && git push origin master`
  end

  desc 'Restore db from latest dump (grabbed code from capistrano-db-tasks gem)'
  task :restore do
    mysql_cmd "mysql %{credentials} -D %{database} < #{REPO_DIR}/db.sql"
  end

  def mysql_cmd(cmd)
    
    unless ENV['WARAIMASU_DATABASE_USERNAME'] && ENV['WARAIMASU_DATABASE_PASSWORD']
      p 'username or password not setted!'
      return
    end
    
    yml = YAML.load_file(Rails.root.join(__FILE__, '../../../config/database.yml'))['production']

    # create this file to avoid warning "Using a password on the command line interface can be insecure"
    file = Tempfile.new('temp-config')
    begin
      file.write <<~CNF
        [client]
        user = #{ENV['WARAIMASU_DATABASE_USERNAME']}
        password = #{ENV['WARAIMASU_DATABASE_PASSWORD']}
        host = #{yml['host'] || 'localhost'}
        port = #{yml['port'] || '3306'}
      CNF
      file.close

      `#{cmd % {credentials: "--defaults-file=#{file.path}", database: yml['database']}}`
    ensure
      file.delete
    end
  end

end