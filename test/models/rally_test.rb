require 'test_helper'

class RallyTest < ActiveSupport::TestCase
  describe 'slug' do
    it 'requires a unique slug' do
      t1 = FactoryGirl.create(:rally, name: "slug", slug: nil)
      t2 = FactoryGirl.build(:rally, name: "slug", slug: nil)
      t2.wont_be :valid?

      t2.errors.must_include(:slug)
    end

    it 'generates a slug from name if the slug is blank' do
      rally = FactoryGirl.build(:rally, slug: nil)
      rally.save
      rally.slug.wont_be_nil
    end

    it 'does not overwrite an existing slug with auto-generated slugs' do
      rally = FactoryGirl.create(:rally)
      original_slug = rally.slug
      rally.name = "Some other name here"
      rally.save!

      rally.slug.must_equal original_slug
    end

    it 'does not include blank spaces in the slug' do
      rally = FactoryGirl.create(:rally, name: "Some great rally name")
      rally.slug.wont_match /\ /
    end

    it 'replaces non alnums with dashes' do
      rally = FactoryGirl.create(:rally, name: FactoryGirl.generate(:rally_name) + "....!" )
      rally.slug.wont_match /\.\!/
    end

    it 'generates a slug from the name' do
      rally = FactoryGirl.create(:rally, name: "A great rally")
      rally.slug.must_equal "a-great-rally"
    end

    it 'does not have extra dashes in the slug' do
      rally = FactoryGirl.create(:rally, name: "one   two   three   ")
      rally.slug.wont_match '--'
    end

    it 'is invalid if name is blank' do
      rally = FactoryGirl.build(:rally, name: nil)
      rally.wont_be :valid?
    end

    it 'does not allow admin as a slug' do
      rally = FactoryGirl.build(:rally, name: "admin")
      rally.wont_be :valid?
      rally.errors.must_include(:slug)
    end

    it 'allows slashes in the slug' do
      slug = "a/great/slug"
      rally = FactoryGirl.build(:rally, slug: slug)
      rally.must_be :valid?
      rally.slug.must_equal slug
    end
  end
end

