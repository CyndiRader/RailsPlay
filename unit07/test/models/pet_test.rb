require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test "an empty pet is not valid" do
    assert !Pet.new.valid?, 'Saved an empty pet.'
    pet = Pet.new
    assert pet.invalid?
    assert pet.errors[:name].any?
    assert_equal [I18n.translate('errors.messages.blank')],pet.errors[:name]
    #puts pet.errors.messages

  end

  test "valid description lengths" do
    assert Pet.new(name: pets(:one).name, age: pets(:one).age,
                   description: pets(:one).description).valid?, "First fixture is valid"
    assert Pet.new(name: pets(:two).name, age: pets(:two).age,
                   description: pets(:two).description).valid?, "Second fixture is valid"
    assert Pet.new(name: pets(:three).name, age: pets(:three).age,
                   description: pets(:three).description).invalid?, "Third fixture description too short"
    assert Pet.new(name: pets(:four).name, age: pets(:four).age,
                   description: pets(:four).description).invalid?, "Fourth fixture description too long"
  end

  test "valid description lengths - options" do
    pet = Pet.new(name: pets(:four).name, age: pets(:four).age,
                  description: pets(:four).description)
    assert pet.invalid?
    # puts pet.errors.messages
    # puts pet.errors[:description]
    assert pet.errors[:description].any?

  end

  test "name cannot be blank" do
    assert Pet.new(name: pets(:noname).name, age: pets(:noname).age,
                   description: pets(:noname).description).invalid?, "Fifth fixture has no name"
  end

  test "blank name" do
    pet = Pet.new(name: pets(:noname).name, age: pets(:noname).age,
                  description: pets(:noname).description)
    assert pet.invalid?
    assert pet.errors[:name].any?
    assert_equal [I18n.translate('errors.messages.blank')],pet.errors[:name]
    # puts pet.errors.messages
  end

end
