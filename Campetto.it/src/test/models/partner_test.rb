require "test_helper"

class PartnerTest < ActiveSupport::TestCase

  def setup
    @partner = Partner.new(
      name: "Mario",
      surname: "Rossi",
      gender: "m",
      mobile: "1234567890",
      birthdate: Date.today - 20.years,
      email: "example@example.com",
      password: "foobar",
      password_confirmation: "foobar"
    )
  end

  # Validation test for name
  test "name should be present" do
    @partner.name = ""
    assert_not @partner.valid?, "Partner should be invalid without a name"
  end
  test "name should not be too short" do
    @partner.name = "A"
    assert_not @partner.valid?, "Partner name should have at least 2 characters"
  end
  test "name should not be too long" do
    @partner.name = "A" * 51
    assert_not @partner.valid?, "Partner name should not have more than 50 characters"
  end

  # Validation test for surname
  test "surname should be present" do
    @partner.surname = ""
    assert_not @partner.valid?, "Partner should be invalid without a surname"
  end
  test "surname should not be too short" do
    @partner.surname = "B"
    assert_not @partner.valid?, "Partner surname should have at least 2 characters"
  end
  test "surname should not be too long" do
    @partner.surname = "B" * 51
    assert_not @partner.valid?, "Partner surname should not have more than 50 characters"
  end

  # Validation test for email
  test "email should be present" do
    @partner.email = ""
    assert_not @partner.valid?, "Partner should be invalid without an email"
  end
  test "email should be unique" do
    duplicate_partner = @partner.dup
    @partner.save
    assert_not duplicate_partner.valid?, "Partner should be invalid with a duplicate email"
  end
  test "email should have valid format" do
    invalid_emails = %w[partner_at_email.com partner@email partner.email.com]
    invalid_emails.each do |invalid_email|
      @partner.email = invalid_email
      assert_not @partner.valid?, "#{invalid_email} should be invalid"
    end
  end
  test "email should accept valid format" do
    valid_emails = %w[partner@email.com PARTNER@foo.COM first.last@foo.jp]
    valid_emails.each do |valid_email|
      @partner.email = valid_email
      assert @partner.valid?, "#{valid_email} should be valid"
    end
  end

  # Validation test for gender
  test "gender can be optional" do
    @partner.gender = nil
    assert @partner.valid?, "Partner should be valid without a gender"
  end
  test "gender should be m, f, or u if present" do
    valid_genders = ["m", "f", "u"]
    valid_genders.each do |valid_gender|
      @partner.gender = valid_gender
      assert @partner.valid?, "#{valid_gender} should be valid"
    end
  end
  test "gender should be invalid if not m, f, or u" do
    @partner.gender = "X"
    assert_not @partner.valid?, "Partner should be invalid with gender not being m, f, or u"
  end
  
  # Validation test for birthdate
  test "birthdate should be present" do
    @partner.birthdate = nil
    assert_not @partner.valid?, "Partner should be invalid without a birthdate"
    assert @partner.errors[:birthdate].include?("can't be blank"), "Error message should indicate birthdate is required"
  end
  test "must be at least 18 years old" do
    @partner.birthdate = 17.years.ago # Un partner che ha 17 anni
    assert_not @partner.valid?, "Partner should be invalid because they are under 18"
    assert @partner.errors[:birthdate].include?("devi avere almeno 18 anni."), "Error message should indicate age requirement"
    @partner.birthdate = 19.years.ago # Ripristina a 19 anni
    assert @partner.valid?, "Partner should be valid when age is 18 or older"
  end

  # Validation test for mobile
  test "should be valid with a valid mobile number" do
    assert @partner.valid?
  end
  test "should be invalid without a mobile number" do
    @partner.mobile = nil
    assert_not @partner.valid?
  end
  test "should be invalid with mobile number shorter than 10 digits" do
    @partner.mobile = "123456789" # 9 cifre
    assert_not @partner.valid?
  end
  test "should be invalid with mobile number longer than 15 digits" do
    @partner.mobile = "+1234567890123456" # 16 cifre
    assert_not @partner.valid?
  end
  test "should be invalid with non-numeric characters in mobile" do
    @partner.mobile = "+12345abcde"
    assert_not @partner.valid?
  end
  test "should be valid with 10-15 digit mobile without plus sign" do
    @partner.mobile = "1234567890" # Esattamente 10 cifre senza '+'
    assert @partner.valid?
  end
  test "should be valid with 10-15 digit mobile with plus sign" do
    @partner.mobile = "+1234567890123" # 13 cifre con '+'
    assert @partner.valid?
  end

end
