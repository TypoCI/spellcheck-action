require 'rails_helper'

RSpec.describe TypoCi::Logger do
  describe '::info' do
    subject { described_class.info('sample') }

    it { expect { subject }.to_not raise_error }

    context 'in production mode' do
      before { ENV['APP_ENV'] = 'production' }
      after { ENV['APP_ENV'] = 'test' }
      it do
        expect { subject }.to output(/\[Typo CI\] sample/).to_stdout
      end
    end
  end
end
