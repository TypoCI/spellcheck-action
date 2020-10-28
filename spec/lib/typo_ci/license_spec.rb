require 'rails_helper'

RSpec.describe TypoCi::License do
  describe '::valid?' do
    subject { described_class.valid? }
    before do
      ENV['INPUT_TYPO_CI_LICENSE_KEY'] = 'XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX'
    end

    after do
      ENV['INPUT_TYPO_CI_LICENSE_KEY'] = nil
    end

    it { is_expected.to eq(true) }

    context 'License key is all wrong format' do
      before do
        ENV['INPUT_TYPO_CI_LICENSE_KEY'] = 'XXXXXXXX-XXXXXXXX'
      end

      it { is_expected.to eq(false) }
    end

    context 'License key is empty' do
      before do
        ENV['INPUT_TYPO_CI_LICENSE_KEY'] = ''
      end

      it { is_expected.to eq(false) }
    end

    context 'License key is missing' do
      before do
        ENV['INPUT_TYPO_CI_LICENSE_KEY'] = nil
      end

      it { is_expected.to eq(false) }
    end
  end
end
