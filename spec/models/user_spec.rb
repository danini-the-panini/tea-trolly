require 'spec_helper'

describe User do
	it {should validate_presence_of(:name)}
	it {should allow_value("John Doe").for(:name)}
	it {should_not allow_value("asd_fas").for(:name)}
	it {should_not validate_uniqueness_of(:name)}
	it {should ensure_length_of(:name).is_at_least(3).is_at_most(100)}
end
