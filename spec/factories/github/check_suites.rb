FactoryBot.define do
  factory :github_check_suite, class: 'Github::CheckSuite' do
    github_token { 'SampleToken' }
    github_run_id { '1000' }
    repository_full_name { 'Sample/TestRepo' }
    head_branch { 'feature/new-stuff' }
    head_sha { 'dcaaa80442e9f86a373dd7f1b84df278ab948ecc' }

    trait :analysed_no_typos do
      conclusion { 'neutral' }
      annotations { [] }
      spelling_mistakes_count { 0 }
      files_analysed_count { 0 }
    end

    trait :analysed_has_typos do
      conclusion { 'success' }
      annotations { [{ annotation_level: :warning, body: '"TypoCI" is a typo' }] }
      spelling_mistakes_count { 1 }
      files_analysed_count { 1 }
    end

    trait :not_analysable do
      head_branch { 'gh-pages' }
    end

    trait :bot_commit do
      actor { 'pull[bot]' }
    end

    trait :pull_request do
      pull_request_number { '4' }
    end

    trait :with_analysis_performed do
      started_at { Time.zone.now }
      completed_at { Time.zone.now + 5.seconds }
      conclusion { 'success' }
      processing_duration { 5 }
      files_analysed_count { 1 }
      spelling_mistakes_count { 0 }
      invalid_words { [] }
      custom_configuration_file { false }
      custom_configuration_valid { true }
    end
  end
end
