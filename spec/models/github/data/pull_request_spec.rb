require 'rails_helper'

RSpec.describe Github::Event::PullRequest do
  let(:file_path) { Rails.root.join('spec', 'fixtures', 'files', 'github_events', 'pull_request', 'synchronize.json').to_s }
  let(:instance_class) { described_class.new(github_event_path: file_path) }

  describe "#pull_request_number" do
    subject { instance_class.pull_request_number }
    it { is_expected.to eq(4) }
  end

  describe "#head_sha" do
    subject { instance_class.head_sha }
    it { is_expected.to eq('ce4f30d782f9c20734e7311f38e878929b1cb859') }
  end

  describe "#repository_full_name" do
    subject { instance_class.repository_full_name }
    it { is_expected.to eq('Sample/TestRepo') }
  end
end
