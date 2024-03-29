# Changelog

## [Unreleased](https://github.com/TypoCI/spellcheck-action/tree/HEAD)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/v1.0.0...HEAD)

**Closed issues:**

- excluded file won't be excluded [\#123](https://github.com/TypoCI/spellcheck-action/issues/123)

**Merged pull requests:**

- Removing Sentry Raven [\#127](https://github.com/TypoCI/spellcheck-action/pull/127) ([MikeRogers0](https://github.com/MikeRogers0))
- Using CSpell dictionaries over relying on maintaining my own [\#126](https://github.com/TypoCI/spellcheck-action/pull/126) ([MikeRogers0](https://github.com/MikeRogers0))
- Allowing the use of .github/.typo-ci.yml [\#124](https://github.com/TypoCI/spellcheck-action/pull/124) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding ecommerce & cakephp words [\#122](https://github.com/TypoCI/spellcheck-action/pull/122) ([MikeRogers0](https://github.com/MikeRogers0))

## [v1.0.0](https://github.com/TypoCI/spellcheck-action/tree/v1.0.0) (2021-04-07)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/v0.4.0...v1.0.0)

**Closed issues:**

- should the config file be disabled by default? [\#116](https://github.com/TypoCI/spellcheck-action/issues/116)
- What's the actual licensing cost? one time 15$ or monthly 30$ [\#112](https://github.com/TypoCI/spellcheck-action/issues/112)
- Bug: Unable to add annotations for PR from forks [\#36](https://github.com/TypoCI/spellcheck-action/issues/36)

**Merged pull requests:**

- Ranking Experiment: Starting the Action Name with A [\#121](https://github.com/TypoCI/spellcheck-action/pull/121) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding currencies to word list [\#120](https://github.com/TypoCI/spellcheck-action/pull/120) ([MikeRogers0](https://github.com/MikeRogers0))
- Removing license requirements & switching to MIT [\#119](https://github.com/TypoCI/spellcheck-action/pull/119) ([MikeRogers0](https://github.com/MikeRogers0))
- Locking github\_changelog\_generator to 1.15.2 [\#118](https://github.com/TypoCI/spellcheck-action/pull/118) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding .github/.typo-ci.yml to default excluded files list [\#117](https://github.com/TypoCI/spellcheck-action/pull/117) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding support for Dutch \(nl\) language [\#115](https://github.com/TypoCI/spellcheck-action/pull/115) ([MikeRogers0](https://github.com/MikeRogers0))

## [v0.4.0](https://github.com/TypoCI/spellcheck-action/tree/v0.4.0) (2021-03-25)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/v0.3.0...v0.4.0)

**Closed issues:**

- How to add another dictionary? [\#111](https://github.com/TypoCI/spellcheck-action/issues/111)
- TypoCI is a typo, apparently [\#110](https://github.com/TypoCI/spellcheck-action/issues/110)
- cronjon anyone? [\#109](https://github.com/TypoCI/spellcheck-action/issues/109)
- Words in excluded\_words being flagged as typos [\#102](https://github.com/TypoCI/spellcheck-action/issues/102)
- Dictionary usage and config file location [\#90](https://github.com/TypoCI/spellcheck-action/issues/90)

**Merged pull requests:**

- Bumping mimemagic to latest [\#114](https://github.com/TypoCI/spellcheck-action/pull/114) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding cron, cronjob & typoci words [\#113](https://github.com/TypoCI/spellcheck-action/pull/113) ([MikeRogers0](https://github.com/MikeRogers0))
- build\(docker\): quote command expansion [\#108](https://github.com/TypoCI/spellcheck-action/pull/108) ([Fdawgs](https://github.com/Fdawgs))
- Updating to Ruby 3.0 [\#106](https://github.com/TypoCI/spellcheck-action/pull/106) ([MikeRogers0](https://github.com/MikeRogers0))
- Removing Dependabot [\#105](https://github.com/TypoCI/spellcheck-action/pull/105) ([MikeRogers0](https://github.com/MikeRogers0))
- Bumping dependencies to latest [\#97](https://github.com/TypoCI/spellcheck-action/pull/97) ([MikeRogers0](https://github.com/MikeRogers0))
- Refactoring StandardRB warnings [\#96](https://github.com/TypoCI/spellcheck-action/pull/96) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding support for .typo-ci.yml within .github folder [\#95](https://github.com/TypoCI/spellcheck-action/pull/95) ([MikeRogers0](https://github.com/MikeRogers0))
- Updating Changelog Generator to push to master [\#89](https://github.com/TypoCI/spellcheck-action/pull/89) ([MikeRogers0](https://github.com/MikeRogers0))
- Copy: Be clearer it checks code for spelling mistakes [\#82](https://github.com/TypoCI/spellcheck-action/pull/82) ([MikeRogers0](https://github.com/MikeRogers0))

## [v0.3.0](https://github.com/TypoCI/spellcheck-action/tree/v0.3.0) (2020-12-16)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/v0.2.0...v0.3.0)

**Implemented enhancements:**

- Adds alternate spellings for parameterise in word list  [\#35](https://github.com/TypoCI/spellcheck-action/pull/35) ([Ollymid](https://github.com/Ollymid))
- Pushing Dockerfile to GitHub Container Registry [\#22](https://github.com/TypoCI/spellcheck-action/pull/22) ([MikeRogers0](https://github.com/MikeRogers0))

**Fixed bugs:**

- bug: Only run on events that have a git push involved [\#8](https://github.com/TypoCI/spellcheck-action/pull/8) ([MikeRogers0](https://github.com/MikeRogers0))

**Merged pull requests:**

- Updating changelog on release [\#81](https://github.com/TypoCI/spellcheck-action/pull/81) ([MikeRogers0](https://github.com/MikeRogers0))
- Bumping dependencies to latest versions [\#80](https://github.com/TypoCI/spellcheck-action/pull/80) ([MikeRogers0](https://github.com/MikeRogers0))
- Updating to Ruby 2.7.2 [\#79](https://github.com/TypoCI/spellcheck-action/pull/79) ([MikeRogers0](https://github.com/MikeRogers0))
- Only tracking major version tag for GitHub Actions [\#78](https://github.com/TypoCI/spellcheck-action/pull/78) ([MikeRogers0](https://github.com/MikeRogers0))
- Updating Rubocop and its rules [\#77](https://github.com/TypoCI/spellcheck-action/pull/77) ([MikeRogers0](https://github.com/MikeRogers0))
- fix spelling mistake in readme [\#76](https://github.com/TypoCI/spellcheck-action/pull/76) ([Odyssey346](https://github.com/Odyssey346))
- Bump zeitwerk from 2.4.1 to 2.4.2 [\#65](https://github.com/TypoCI/spellcheck-action/pull/65) ([dependabot-preview[bot]](https://github.com/apps/dependabot-preview))
- Bump rspec from 3.9.0 to 3.10.0 [\#54](https://github.com/TypoCI/spellcheck-action/pull/54) ([dependabot[bot]](https://github.com/apps/dependabot))
- Encourage running on "push" over "pull\_request" [\#53](https://github.com/TypoCI/spellcheck-action/pull/53) ([MikeRogers0](https://github.com/MikeRogers0))
- Blocking bot users from trigger actions [\#52](https://github.com/TypoCI/spellcheck-action/pull/52) ([MikeRogers0](https://github.com/MikeRogers0))
- Updating Readme to include upsell about GitHub App [\#51](https://github.com/TypoCI/spellcheck-action/pull/51) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding support for Turkish [\#50](https://github.com/TypoCI/spellcheck-action/pull/50) ([MikeRogers0](https://github.com/MikeRogers0))
- Bump rubocop from 0.92.0 to 1.1.0 [\#49](https://github.com/TypoCI/spellcheck-action/pull/49) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump zeitwerk from 2.4.0 to 2.4.1 [\#48](https://github.com/TypoCI/spellcheck-action/pull/48) ([dependabot[bot]](https://github.com/apps/dependabot))
- Updating all the gems to latest [\#46](https://github.com/TypoCI/spellcheck-action/pull/46) ([MikeRogers0](https://github.com/MikeRogers0))
- Update Rubocop GitHub Action [\#45](https://github.com/TypoCI/spellcheck-action/pull/45) ([MikeRogers0](https://github.com/MikeRogers0))
- link to RSpec workflow results instead of badge [\#44](https://github.com/TypoCI/spellcheck-action/pull/44) ([LucasLarson](https://github.com/LucasLarson))
- Bump actions/cache from v2.1.1 to v2.1.2 [\#40](https://github.com/TypoCI/spellcheck-action/pull/40) ([dependabot[bot]](https://github.com/apps/dependabot))
- Adding follow link for @MikeRogers0 [\#33](https://github.com/TypoCI/spellcheck-action/pull/33) ([MikeRogers0](https://github.com/MikeRogers0))
- Bump actions/setup-ruby from v1.1.1 to v1.1.2 [\#32](https://github.com/TypoCI/spellcheck-action/pull/32) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump rubocop from 0.90.0 to 0.92.0 [\#31](https://github.com/TypoCI/spellcheck-action/pull/31) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump rubocop from 0.89.1 to 0.90.0 [\#21](https://github.com/TypoCI/spellcheck-action/pull/21) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump codecov from 0.2.8 to 0.2.9 [\#20](https://github.com/TypoCI/spellcheck-action/pull/20) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump sentry-raven from 3.0.2 to 3.0.4 [\#19](https://github.com/TypoCI/spellcheck-action/pull/19) ([dependabot[bot]](https://github.com/apps/dependabot))
- Tidying up wording in readme [\#17](https://github.com/TypoCI/spellcheck-action/pull/17) ([MikeRogers0](https://github.com/MikeRogers0))
- Bump codecov from 0.2.6 to 0.2.8 [\#16](https://github.com/TypoCI/spellcheck-action/pull/16) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump sentry-raven from 3.0.0 to 3.0.2 [\#15](https://github.com/TypoCI/spellcheck-action/pull/15) ([dependabot[bot]](https://github.com/apps/dependabot))
- Running test suite from within container [\#13](https://github.com/TypoCI/spellcheck-action/pull/13) ([MikeRogers0](https://github.com/MikeRogers0))
- Adding notes on how to configure the action [\#12](https://github.com/TypoCI/spellcheck-action/pull/12) ([MikeRogers0](https://github.com/MikeRogers0))
- Bump actions/cache from v2.1.0 to v2.1.1 [\#11](https://github.com/TypoCI/spellcheck-action/pull/11) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump jwt from 2.2.1 to 2.2.2 [\#10](https://github.com/TypoCI/spellcheck-action/pull/10) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump codecov from 0.2.5 to 0.2.6 [\#9](https://github.com/TypoCI/spellcheck-action/pull/9) ([dependabot[bot]](https://github.com/apps/dependabot))
- Bump actions/setup-ruby from v1 to v1.1.1 [\#7](https://github.com/TypoCI/spellcheck-action/pull/7) ([dependabot[bot]](https://github.com/apps/dependabot))
- Update actions/cache requirement to v2.1.0 [\#6](https://github.com/TypoCI/spellcheck-action/pull/6) ([dependabot[bot]](https://github.com/apps/dependabot))
- Adding Badges to Readme [\#5](https://github.com/TypoCI/spellcheck-action/pull/5) ([MikeRogers0](https://github.com/MikeRogers0))

## [v0.2.0](https://github.com/TypoCI/spellcheck-action/tree/v0.2.0) (2020-08-17)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/v0.1.0...v0.2.0)

**Implemented enhancements:**

- feat: Using prebuilt docker image to speed up run times [\#4](https://github.com/TypoCI/spellcheck-action/pull/4) ([MikeRogers0](https://github.com/MikeRogers0))

**Fixed bugs:**

- Bug: Use correct repo name for changelog [\#3](https://github.com/TypoCI/spellcheck-action/pull/3) ([MikeRogers0](https://github.com/MikeRogers0))
- Bug: Correcting sample install code [\#1](https://github.com/TypoCI/spellcheck-action/pull/1) ([MikeRogers0](https://github.com/MikeRogers0))

**Merged pull requests:**

- feat: Adding auto updating changelog [\#2](https://github.com/TypoCI/spellcheck-action/pull/2) ([MikeRogers0](https://github.com/MikeRogers0))

## [v0.1.0](https://github.com/TypoCI/spellcheck-action/tree/v0.1.0) (2020-08-17)

[Full Changelog](https://github.com/TypoCI/spellcheck-action/compare/0cfaa2ca908b4703af0170f1703344c5e17ee626...v0.1.0)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
