require 'rails_helper'

RSpec.describe Parser::Fonbet::Runner do
  let(:runner) do
    # allow_any_instance_of(Parser::Fonbet::Event::Collection).to receive(:parse).and_return([])
    # allow_any_instance_of(Parser::Fonbet::Factor::Collection).to receive(:parse).and_return([])
    options = {
      getter: Parser::Fonbet::Getter.new(enable_loop: false)
    }
    described_class.new(options)
  end

  describe 'public' do
    it 'start' do
      runner.start
      expect(runner.event_thread.status).to match('run')
      expect(runner.factor_thread.status).to match('run')
      expect(runner.getter.status).to match('run')
    end
    it 'stop' do
      runner.start
      runner.stop
      sleep 0.1
      expect(runner.event_thread.status).to be false
      expect(runner.factor_thread.status).to be false
      expect(runner.getter.status).to be false
    end
    it 'status' do
      runner.start
      expect(runner.status[:event]).to match('run')
      expect(runner.status[:factor]).to match('run')
      expect(runner.status[:getter]).to match('run')
    end
  end
end
