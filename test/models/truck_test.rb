require 'test_helper'

describe Truck do
  it "requires a name" do
    truck = Truck.new(name: nil)
    truck.wont_be :valid?
    truck.errors.must_include(:name)
  end

  describe 'slug' do
    it 'requires a unique slug' do
      t1 = FactoryGirl.create(:truck, name: "slug", slug: nil)
      t2 = FactoryGirl.build(:truck, name: "slug", slug: nil)
      t2.wont_be :valid?

      t2.errors.must_include(:slug)
    end

    it 'generates a slug from name if the slug is blank' do
      truck = FactoryGirl.build(:truck, slug: nil)
      truck.save
      truck.slug.wont_be_nil
    end

    it 'does not overwrite an existing slug with auto-generated slugs' do
      truck = FactoryGirl.create(:truck)
      original_slug = truck.slug
      truck.name = "Some other name here"
      truck.save!

      truck.slug.must_equal original_slug
    end

    it 'does not include blank spaces in the slug' do
      truck = FactoryGirl.create(:truck, name: "Some great truck name")
      truck.slug.wont_match /\ /
    end

    it 'replaces non alnums with dashes' do
      truck = FactoryGirl.create(:truck, name: FactoryGirl.generate(:truck_name) + "....!" )
      truck.slug.wont_match /\.\!/
    end

    it 'generates a slug from the name' do
      truck = FactoryGirl.create(:truck, name: "A great truck")
      truck.slug.must_equal "a-great-truck"
    end

    it 'does not have extra dashes in the slug' do
      truck = FactoryGirl.create(:truck, name: "one   two   three   ")
      truck.slug.wont_match '--'
    end

    it 'is invalid if name is blank' do
      truck = FactoryGirl.build(:truck, name: nil)
      truck.wont_be :valid?
    end

    it 'does not allow admin as a slug' do
      truck = FactoryGirl.build(:truck, name: "admin")
      truck.wont_be :valid?
      truck.errors.must_include(:slug)
    end

    it 'allows slashes in the slug' do
      slug = "a/great/slug"
      truck = FactoryGirl.build(:truck, slug: slug)
      truck.must_be :valid?
      truck.slug.must_equal slug
    end
  end
end

