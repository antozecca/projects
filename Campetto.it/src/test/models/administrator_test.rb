require "test_helper"

class AdministratorTest < ActiveSupport::TestCase
  
  def setup
    @administrator = Administrator.new(
      name: "Mario",
      surname: "Rossi",
      email: "mario.rossi@minitest.com",
      password: "foobar",
      password_confirmation: "foobar"
    )
  end

  #Name validation test section  
  test "name should be present" do
    @administrator.name = ""
    assert_not @administrator.valid?, "Administrator should be invalid without a name"
  end

  test "name should not be too short" do
    @administrator.name = "A"
    assert_not @administrator.valid?, "Administrator name should have at least 2 characters"
  end

  test "name should not be too long" do
    @administrator.name = "A" * 51
    assert_not @administrator.valid?, "Administrator name should not have more than 50 characters"
  end

  #Surname validation test section
  test "surname should be present" do
    @administrator.surname = ""
    assert_not @administrator.valid?, "Administrator should be invalid without a surname"
  end

  test "surname should not be too short" do
    @administrator.surname = "A"
    assert_not @administrator.valid?, "Administrator surname should have at least 2 characters"
  end

  test "surname should not be too long" do
    @administrator.surname = "A" * 51
    assert_not @administrator.valid?, "Administrator surname should not have more than 50 characters"
  end

  #Email validation test section
  test "email should be present" do
    @administrator.email = ""
    assert_not @administrator.valid?, "Administrator should be invalid without an email"
  end

  test "email should be unique" do
    duplicate_administrator = @administrator.dup
    @administrator.save
    assert_not duplicate_administrator.valid?, "Administrator should be invalid with a duplicate email"
  end

  test "email should have valid format" do
    invalid_emails = %w[administrator_at_email.com administrator@email administrator.email.com]
    invalid_emails.each do |invalid_email|
      @administrator.email = invalid_email
      assert_not @administrator.valid?, "#{invalid_email} should be invalid"
    end
  end

  test "email should accept valid format" do
    valid_emails = %w[administrator@email.com ADMINISTRATOR@foo.COM first.last@foo.jp]
    valid_emails.each do |valid_email|
      @administrator.email = valid_email
      assert @administrator.valid?, "#{valid_email} should be valid"
    end
  end

  #Password validation test section
  test "password should have a minimum length" do
    @administrator.password = @administrator.password_confirmation = "a" * 5
    assert_not @administrator.valid?, "Administrator password should have at least 6 characters"
  end

end
