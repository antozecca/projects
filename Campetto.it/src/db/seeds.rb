# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.destroy_all

admin_root = Administrator.create!(
    name:                   "Root",
    surname:                "Campetto.it",
    email:                  "root@campetto.it",
    password_digest:        Administrator.digest('1q2w3e'),
    root:                   true
)
puts "Amministratore root creato: #{admin_root.email}"


# --- Partner demo + Centro demo + associazione campi ---

partner_email = 'partner@example.com'

partner = Partner.find_or_create_by!(email: partner_email) do |p|
  p.name                  = 'Mario'
  p.surname               = 'Rossi'
  p.gender                = 'm'                   # 'm'/'f'/'u' oppure ometti
  p.mobile                = '+393331234567'       # 10-15 cifre, + opzionale
  p.birthdate             = Date.new(1999,1,1)
  p.password              = 'Password!123'
  p.password_confirmation = 'Password!123'
  p.activated             = true
  p.activated_at          = Time.zone.now
end
puts "Partner demo: #{partner.email}"

# Valori validi per le regex italiane (CF/P.IVA/IBAN/email/telefono)
sc = SportsCenter.find_or_initialize_by(company_name: 'Centro Demo Campetto')
sc.tax_code         = 'RSSMRA99A01H501U'         # CF plausibile
sc.vat_number       = 'IT12345678901'            # P.IVA 11 cifre con IT
sc.iban             = 'IT60X0542811101000000123456'
sc.email            = 'centro.demo@campetto.it'
sc.phone            = '+39061234567'
sc.registered_office= 'Via di Test 1, 00100 Roma (RM)'
sc.owner            = partner
sc.save!
puts "SportsCenter demo di #{partner.email}: #{sc.company_name}"

# Associa tutti i Field esistenti al centro demo (solo quelli senza centro)
Field.where(sports_center_id: nil).find_each do |f|
  f.update_columns(sports_center_id: sc.id)  # diretto, evita validazioni/geocoding
end
puts "Associati #{Field.where(sports_center_id: sc.id).count} campi al centro demo."

if Field.count.zero?
  puts "Seeding campi demo…"

  demo_fields = [
    { nome: "Campo Corso",  descrizione: "Erba sintetica, luci serali", sport: "Calcio",  prezzo: 50,
      via: "Via del Corso 1",  cap: "00186", citta: "Roma",
      start_time: "09:00", end_time: "22:00", interval: 60, exclude_days: [] },

    { nome: "Campo Navona", descrizione: "Ottimo per tennis singolo/doppio", sport: "Tennis", prezzo: 40,
      via: "Piazza Navona 10", cap: "00186", citta: "Roma",
      start_time: "09:00", end_time: "22:00", interval: 60, exclude_days: [] },

    { nome: "Campo Traste", descrizione: "Parquet indoor", sport: "Basket", prezzo: 35,
      via: "Viale Trastevere", cap: "00153", citta: "Roma",
      start_time: "09:00", end_time: "22:00", interval: 60, exclude_days: [] }
  ]

  demo_fields.each do |attrs|
    f = Field.create!(attrs)
    # forziamo geocoding immediato (oltre al callback) ed evitiamo blocchi di validazione
    f.geocode
    f.save!(validate: false)
  end

  puts "Creati #{Field.count} campi demo."
else
  puts "Campi già presenti: #{Field.count}."
end
