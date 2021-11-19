namespace :fonbet do
  desc "Start Parser"
  task run: :environment do
    run = Parser::Fonbet::Runner.new
    run.start
    loop do
      puts run.status
      sleep 5
    end
  end
end
