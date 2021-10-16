require 'rails_helper'

RSpec.describe Parser::Fonbet::Getter do
  let(:getter) { described_class.new(enable_loop: false) }
  let(:getter_with_loop) { described_class.new(enable_loop: true) }

  describe 'public' do
    it 'live_json' do
      getter.start
      sleep 1
      expect(getter.live_json.en).to be_truthy
      expect(getter.live_json.ru).to be_truthy
    end

    it 'start' do
      getter_with_loop.start
      expect(getter_with_loop.live_thread.status).to match('run')
      getter_with_loop.stop
    end

    it 'stop' do
      getter_with_loop.start
      getter_with_loop.stop
      sleep 0.1
      expect(getter_with_loop.live_thread.status).to be false
    end

    it 'status' do
      getter_with_loop.start
      expect(getter_with_loop.live_thread.status).to match(getter_with_loop.status)
      getter_with_loop.stop
    end
  end
end
