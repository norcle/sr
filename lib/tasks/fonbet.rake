namespace :fonbet do
  desc "Start Parser"
  task run: :environment do
    run = Parser::Fonbet::Runner.new
    run.start
    loop do
      p run.status
      run.restart if run.problem?
      sleep 5
    end
  end
end
