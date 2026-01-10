# features/step_definitions/stripe_steps.rb

Given("I am a registered user") do
  @user = User.create(email: 'test@example.com', password: 'password')
end

When("I enter valid payment details") do
  # Questa chiamata sarà stubbata da WebMock
  @charge = Stripe::Charge.create({
    customer: 'cus_test123',
    amount: 5000,
    description: 'Test Charge',
    currency: 'usd'
  })
end

Then("a Stripe charge should be created") do
  expect(@charge.amount).to eq(5000)
  expect(@charge.currency).to eq('usd')
  expect(@charge.status).to eq('succeeded')
end

