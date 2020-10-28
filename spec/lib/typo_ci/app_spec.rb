require 'rails_helper'

RSpec.describe TypoCi::App do
  let(:instance_class) { described_class.new }
  let(:event_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'github_events', 'pull_request', 'synchronize.json').to_s }
  before do
    ENV['GITHUB_EVENT_NAME'] = 'pull_request'
    ENV['GITHUB_EVENT_PATH'] = event_file_path
    ENV['GITHUB_REPOSITORY'] = 'Sample/TestRepo'
    ENV['GITHUB_HEAD_REF'] = 'feature/add-debugging'
  end

  describe '#call' do
    subject { instance_class.call }

    it do
      expect(Github::CheckSuites::RequestedJob).to receive(:perform_now) do |check_suite|
        expect(check_suite.pull_request?).to eq(true)
        expect(check_suite.repository_full_name).to eq('Sample/TestRepo')
        expect(check_suite.head_sha).to eq('ce4f30d782f9c20734e7311f38e878929b1cb859')
        expect(check_suite.head_branch).to eq('feature/add-debugging')
      end
      subject
    end

    context 'a just opened PR' do
      let(:event_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'github_events', 'pull_request', 'open.json').to_s }

      it do
        expect(Github::CheckSuites::RequestedJob).to receive(:perform_now) do |check_suite|
          expect(check_suite.pull_request?).to eq(true)
          expect(check_suite.repository_full_name).to eq('Sample/TestRepo')
          expect(check_suite.head_sha).to eq('ea3096e07392ca67a49f96cff594d634b679892e')
          expect(check_suite.head_branch).to eq('feature/add-debugging')
        end
        subject
      end
    end

    context 'an PR is edited' do
      let(:event_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'github_events', 'pull_request', 'edited.json').to_s }

      it do
        expect(Github::CheckSuites::RequestedJob).to_not receive(:perform_now)
        expect(TypoCi::Logger).to receive(:info).with("'pull_request' action 'edited' is unsupported. Skipping typo scan.")
        subject
      end
    end

    context 'push event' do
      let(:event_file_path) { Rails.root.join('spec', 'fixtures', 'files', 'github_events', 'push.json').to_s }
      before do
        ENV['GITHUB_EVENT_NAME'] = 'push'
        ENV['GITHUB_HEAD_REF'] = 'master'
      end

      it do
        expect(Github::CheckSuites::RequestedJob).to receive(:perform_now) do |check_suite|
          expect(check_suite.pull_request?).to eq(false)
          expect(check_suite.repository_full_name).to eq('Sample/TestRepo')
          expect(check_suite.head_sha).to eq('8cf3b17fff0ef998dde262994c9448deb4300302')
          expect(check_suite.head_branch).to eq('master')
        end
        subject
      end
    end

    context 'unknown event' do
      before { ENV['GITHUB_EVENT_NAME'] = 'unknown' }

      it do
        expect(TypoCi::Logger).to receive(:info).with("'unknown' is an unsupported event. Skipping typo scan.")
        expect(Github::CheckSuites::RequestedJob).to_not receive(:perform_now).with(Github::CheckSuite)
        subject
      end
    end
  end
end
