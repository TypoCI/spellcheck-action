# This check if the License key is valid.
# For now, I'm just going to get it's present & the right format.
# In the future, I might check against the Gumtree server but for now I'm not fussed.
# The license key is stored in: ENV['INPUT_TYPO_CI_LICENSE_KEY']
module TypoCi
  class License
    def self.valid?
      ENV['INPUT_TYPO_CI_LICENSE_KEY'].present? && ENV['INPUT_TYPO_CI_LICENSE_KEY'].length >= 32
    end
  end
end
