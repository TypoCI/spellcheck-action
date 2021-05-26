task :environment do
  require './config/environment'
end

namespace :typo_ci do
  desc 'Checks for Typos within a GitHub Action'
  task analyse_github_action: :environment do
    TypoCi::App.run
  end

  namespace :dictionaries do
    desc 'Combines all the custom dictionaries into a single big one'
    task combine_custom: :environment do
      Dictionaries::CombineService.new.call
    end
  end

  namespace :repositories do
    desc 'Looks at open source repos, looks for spelling mistakes'
    task analyse_popular: :environment do
      [
        # Ruby
        'mikerogers0/mikerogersio'
      ].each do |repository|
        started_at = Time.zone.now
        analysis = Github::Repositories::AnalysisService.new(repository)
        analysis.perform!
        puts "Analysis took: (#{(Time.zone.now - started_at).to_i})"
      end
    end
  end
end
