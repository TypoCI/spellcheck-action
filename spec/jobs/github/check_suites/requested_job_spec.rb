require 'rails_helper'

RSpec.describe Github::CheckSuites::RequestedJob, type: :job do
  let(:github_check_suite) { build(:github_check_suite) }
  let(:instance_class) { described_class.new }
  let(:configuration_service) do
    double(
      :configuration_service,
      custom_configuration_file?: true,
      custom_configuration_valid?: true,
      configuration: Spellcheck::Configuration.new
    )
  end

  before do
    allow(instance_class).to receive(:configuration_service).and_return(configuration_service)
    allow(Github::CheckSuites::AnalysisJob).to receive(:perform_now)
  end

  describe '#perform' do
    subject { instance_class.perform(github_check_suite) }

    context 'saves data about the commit & the configuration we should use' do
      it { expect { subject }.to change { github_check_suite.custom_configuration_file? }.from(false).to(true) }
      it { expect { subject }.to change { github_check_suite.custom_configuration_valid? }.from(false).to(true) }
      it { expect { subject }.to change { github_check_suite.configuration }.from(nil).to(Spellcheck::Configuration) }
    end

    it 'Does queues up AnalysisJob' do
      expect(Github::CheckSuites::AnalysisJob).to receive(:perform_now).with(github_check_suite)
      subject
    end

    context "check suite isn't analysable" do
      let(:github_check_suite) { build(:github_check_suite, :not_analysable) }

      it 'Does not queue up AnalysisJob' do
        expect(Github::CheckSuites::AnalysisJob).to_not receive(:perform_now)
        subject
      end
    end
  end
end
