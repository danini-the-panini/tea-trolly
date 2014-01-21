require 'spec_helper'

describe Item do
	it {should validate_presence_of(:name)}
	it {should validate_uniqueness_of(:name)}
	it {should ensure_length_of(:name).is_at_least(3)}
	it {should validate_presence_of(:price)}
	it {should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0)}
	it {should validate_presence_of(:description)}
end
