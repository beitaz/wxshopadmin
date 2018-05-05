discovers = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'discovers.json')))
discovers['list'].each do |discover|
  brand = discover['attrs'][0]
  season = discover['attrs'][1]
  Discover.create(code: discover['code'],
                  logo: discover['logo'],
                  brand: brand['attrValList'][0]['attrVal'],
                  brand_category: brand['attrName']['categoryCode'],
                  season: season['attrValList'][0]['attrVal'],
                  season_category: season['attrName']['categoryCode'])
end
