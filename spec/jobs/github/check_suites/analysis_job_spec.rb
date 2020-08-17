require 'rails_helper'

RSpec.describe Github::CheckSuites::AnalysisJob, type: :job do
  let(:github_check_suite) { build(:github_check_suite) }
  let(:instance_class) { described_class.new }
  let(:analysis_service) do
    double(
      :analysis_service,
      conclusion: 'success',
      annotations: [],
      invalid_words: [],
      files_analysed_count: 1,
      spelling_mistakes_count: 0,
      file_name_extensions: ['css']
    )
  end

  before do
    allow(instance_class).to receive(:analysis_service).and_return(analysis_service)
    allow(Github::CheckSuites::UpdateRemoteJob).to receive(:perform_now)
  end

  describe '#perform' do
    subject { instance_class.perform(github_check_suite) }

    context 'saves annotations, analytics about queue time & processing time' do
      it { expect { subject }.to change { github_check_suite.conclusion }.from('pending').to('success') }
      it { expect { subject }.to change { github_check_suite.started_at }.from(nil).to(Time) }
      it { expect { subject }.to change { github_check_suite.completed_at }.from(nil).to(Time) }
      it { expect { subject }.to change { github_check_suite.processing_duration }.from(nil).to(Integer) }

      it { expect { subject }.to change { github_check_suite.annotations }.from(nil).to(Array) }

      it { expect { subject }.to change { github_check_suite.invalid_words }.from(nil).to(Array) }
      it { expect { subject }.to change { github_check_suite.files_analysed_count }.from(nil).to(Integer) }
      it { expect { subject }.to change { github_check_suite.spelling_mistakes_count }.from(nil).to(Integer) }
      it { expect { subject }.to change { github_check_suite.file_name_extensions }.from(nil).to(Array) }
    end

    it 'Queues up the job to update GitHub' do
      expect(Github::CheckSuites::UpdateRemoteJob).to receive(:perform_now).with(github_check_suite)
      subject
    end
  end
end
