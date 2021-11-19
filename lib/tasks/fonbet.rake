namespace :fonbet do
  desc "Start Parser"
  task run: :environment do
    run = Parser::Fonbet::Runner.new
    run.start
    loop do
      p run.status
      if run.status[:getter].nil? || run.status[:event].nil? || run.status[:factor].nil?
        run.stop
        run.start
      end
      sleep 5
    end
  end
end
