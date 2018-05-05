good = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'detail.json')))
Business.find_or_create_by(uid: good['businessId']) do |b|
  b.brand_name = good['brandName']
  b.name = good['businessName']
end