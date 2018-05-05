recommends = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'recommends.json')))

recommends['list'].each do |recommend|
  business = Business.find_or_create_by(uid: recommend['businessId']) do |b|
    b.brand_name = '素洁'
    b.name = recommend['businessName']
  end

  Good.find_or_create_by(uid: recommend['id']) do |g|
    g.recommend = true
    g.market_price = recommend['marketPrice']
    g.sale_count = recommend['saleCount']
    g.business_id = business.id
    g.brand_name = business.brand_name
    g.thum_logo = recommend['thumLogo']
    g.title = recommend['title']
    g.evaluate_count = recommend['evaluateCount']
    g.price = recommend['price']
    g.name = recommend['name']
    g.code = recommend['name'].split(' ').last
    g.stock_num = recommend['stockNum']
    g.whole_price = recommend['wholePrice']
    g.logo = recommend['logo']
  end
end
