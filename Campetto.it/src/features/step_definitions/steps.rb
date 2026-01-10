# Visite pagine
Given("I am on the signup page") do
    visit logReg_path  
end

Given("I visit the root path") do
    visit root_path
end

When("I visit login page") do
    visit logReg_path
end

When("I visit the confirmation link with token {string}") do |token|
    visit confirm_user_path(token: token)  
end

When("I visit my account page") do
    visit accountUtente_path

    expect(page).not_to have_current_path(logReg_path)
end

Then("I should be redirected to login page") do
    expect(current_path).to eq(logReg_path)
end

Then("I should be redirected to account page") do
    expect(current_path).to eq(accountUtente_path)
end

When("I visit the partner login page") do
    visit partner_log_in_path
end

Then("I should be redirected to partner dashboard") do
    expect(current_path).to eq(partner_dashboard_path)
end
# Riempimento form
When("I fill in {string} with {string}") do |field, value|
    fill_in field, with: value
end

When("I check {string}") do |checkbox|
    check checkbox
end
  
When('I click on {string}') do |button_text|
    find("input[type='submit'][value='#{button_text}']").click
end

When("I select {string} from {string}") do |option, field|
    select option, from: field
end

# Interazione pagina
Then("I should see {string}") do |message|
    expect(page).to have_content(message)
end

When('I click on field {string}') do |field_name|
    find('.field-card', text: field_name).click
end

Then('I click on the book button for the slot {string}') do |slot_time|
    find('.slot-card', text: slot_time).find('.btn-success').click
end

# check database
Then("a user with email {string} should exist") do |email|
    expect(User.find_by(email: email)).to be_present
end

Then('I should not see a new user in the database') do
    expect(User.count).to eq(0) 
    expect(User.find_by(email: "test2@example.com")).to be_nil
end

# Create per i test
Given("I have registered a user with email {string} and password {string}") do |email, password|
    @user = User.create!(
      email: email,
      password: password,
      password_confirmation: password,
      confirmation_token: SecureRandom.hex(10),
      confirmation_sent_at: Time.now
    )
end
  
Given("I have confirmed a user with email {string} and password {string}") do |email, password|
    User.create!(
      email: email,
      password: password,
      password_confirmation: password, 
      confirmed_at: Time.now            
    )
end

Given("I am logged in as a confirmed user with email {string} and password {string}") do |email, password|
    user = User.create!(
      email: email,
      password: password,
      password_confirmation: password,
      confirmed_at: Time.current
    )
  
    visit logReg_path
  
    # Compila il form di login con le credenziali
    fill_in "email_login", with: email
    fill_in "password_login", with: password
  
    # Invia il form
    click_button "Login"
  
    puts "User created and logged in with ID: #{user.id}"
end

Given("a field with the following details:") do |table|
    field_attributes = table.rows_hash
  
    # Converti 'exclude_days' da stringa ad array
    if field_attributes['exclude_days']
      field_attributes['exclude_days'] = field_attributes['exclude_days'].split(',').map(&:strip)
    end
  
    # Crea il campo nel database
    @field = Field.create!(field_attributes)

    expect(Field.find_by(nome: field_attributes['nome'])).not_to be_nil, "Expected to find field #{field_attributes['nome']} in the database"

    available_slots = Slot.where(field_id: @field.id).count
    expect(available_slots).to be > 100, "Expected to find more than 0 available slots, found #{available_slots}"
end
  

Given("I have a confirmed partner") do
    @partner = Partner.create!(
      name: "Mario",
      surname: "Rossi",
      gender: "",
      birthdate: "1990-01-01",
      mobile: "1234567890",
      email: "partner@example.com",
      password: "Password@1",
      password_confirmation: "Password@1"
    )
    
    @partner.update_attribute(:activated, true)
    @partner.update_attribute(:activated_at, Time.zone.now)
    @partner.reload
end

Then('I should be redirected to {string}') do |url|
    expect(page).to have_current_path(url)
end

Then('a new booking should be registered in the database') do
    expect(Booking.count).to eq(1) # Verifica che sia stata creata una prenotazione
end