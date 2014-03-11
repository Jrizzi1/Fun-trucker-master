module Slugable
  extend ActiveSupport::Concern

  included do
    validates :slug, uniqueness: true, presence: true, exclusion: { in: %w[admin] }

    before_validation :generate_slug
  end

  def link
    "/#{self.slug}"
  end

  private
  def generate_slug
    return true if self.slug.present?
    self.slug = self.name.to_s.gsub(/[^[:alnum:]]+/, '-').downcase
  end
end

