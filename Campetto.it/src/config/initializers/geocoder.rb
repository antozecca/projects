if Rails.env.development? || Rails.env.test?
  Geocoder.configure(
    lookup: :nominatim,
    use_https: true,
    units: :km,
    language: :it,
    timeout: 5,
    logger: Rails.logger
  )
else
  Geocoder.configure(
    lookup: :opencagedata,
    api_key: ENV['GEOCODER_OPENCAGEDATA_KEY'],
    use_https: true,
    params: { countrycode: 'it', limit: 1 },
    units: :km,
    language: :it,
    timeout: 5,
    logger: Rails.logger
  )
end
