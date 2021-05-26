require 'rails_helper'

RSpec.describe Github::CheckSuites::ConfigurationService do
  let(:github_check_suite) { build(:github_check_suite) }
  let(:instance_class) { described_class.new(github_check_suite) }
  let(:github_octokit_service) do
    double :github_octokit_service,
           get_pull_request_commits: [],
           commit: {},
           compare: { commits: [] }
  end

  before { allow(instance_class).to receive(:github_octokit_service).and_return(github_octokit_service) }

  describe '#configuration' do
    subject { instance_class.configuration }

    let(:default_values_with_ignores) do
      Spellcheck::Configuration::DEFAULT_VALUES.merge({ excluded_words: %w[typoci Sample TestRepo] })
    end

    context 'Without .typo-ci.yml file' do
      before { allow(github_octokit_service).to receive(:get_file_contents).and_raise(Octokit::NotFound) }
      it { expect(subject.to_h).to eq(default_values_with_ignores) }
      it { expect { subject }.to_not change(instance_class, :custom_configuration_file?).from(false) }
    end

    context 'With invalid .typo-ci.yml file' do
      before { allow(github_octokit_service).to receive(:get_file_contents).and_return("apple: 'pie\'s'") }
      it { expect(subject.to_h).to eq(default_values_with_ignores) }
      it { expect { subject }.to change(instance_class, :custom_configuration_file?).from(false).to(true) }
      it { expect { subject }.to_not change(instance_class, :custom_configuration_valid?).from(false) }
    end

    context 'With incorrectly formatted .typo-ci.yml file' do
      before { allow(github_octokit_service).to receive(:get_file_contents).and_return("dictionaries: 'en_GB'") }
      it { expect(subject.to_h[:dictionaries]).to eq(%w[en en_GB]) }
    end

    context 'With file in .github/.typo-ci.yml' do
      before do
        allow(github_octokit_service).to receive(:get_file_contents)
          .with(github_check_suite.repository_full_name, '.typo-ci.yml', github_check_suite.head_sha)
          .and_raise(Octokit::NotFound)

        allow(github_octokit_service).to receive(:get_file_contents)
          .with(github_check_suite.repository_full_name, '.github/.typo-ci.yml', github_check_suite.head_sha)
          .and_return("dictionaries: \n - en_GB")
      end

      it { expect(subject.to_h[:dictionaries]).to eq(%w[en_GB]) }
      it { expect { subject }.to change(instance_class, :custom_configuration_file?).from(false).to(true) }
      it { expect { subject }.to change(instance_class, :custom_configuration_valid?).from(false).to(true) }
    end

    context 'Includes repository author and name in excluded words list' do
      before { allow(github_octokit_service).to receive(:get_file_contents).and_raise(Octokit::NotFound) }
      let(:github_check_suite) { build(:github_check_suite, repository_full_name: 'Samplemin/Weirdname') }

      it 'includes repo author and name in excluded words' do
        expect(subject.excluded_words).to include('Samplemin', 'Weirdname')
      end
    end

    context 'Includes the commit authors' do
      before { allow(github_octokit_service).to receive(:get_file_contents).and_raise(Octokit::NotFound) }
      let(:get_pull_request_commits) do
        [
          {
            commit: { author: { name: 'Mike McNoodle' } },
            committer: { login: 'MikeMcNoodle0' }
          },
          {
            commit: { author: { name: 'Marty McBoss' } },
            committer: { login: 'Bossman' }
          }
        ]
      end
      let(:github_check_suite) { build(:github_check_suite) }

      context 'CheckSuite is a pull request' do
        let(:github_check_suite) { build(:github_check_suite, :pull_request) }
        before do
          allow(github_octokit_service).to receive(:get_pull_request_commits).and_return(get_pull_request_commits)
        end

        it do
          expect(subject.excluded_words).to include('Mike', 'McNoodle', 'MikeMcNoodle0', 'Marty', 'McBoss', 'Bossman')
        end
      end

      context 'CheckSuite is the first commit' do
        let(:github_check_suite) { build(:github_check_suite) }
        let(:commit) do
          {
            commit: { author: { name: 'Mike McNoodle' } },
            committer: { login: 'MikeMcNoodle0' }
          }
        end

        before do
          allow(github_octokit_service).to receive(:commit).and_return(commit)
        end

        it do
          expect(subject.excluded_words).to include('Mike', 'McNoodle', 'MikeMcNoodle0')
        end
      end
    end
  end
end
