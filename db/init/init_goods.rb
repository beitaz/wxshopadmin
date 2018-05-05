good = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'detail.json')))
business = Business.find_or_create_by(uid: good['businessId']) do |b|
             b.brand_name = good['brandName']
             b.name = good['businessName']
           end

Good.find_or_create_by(uid: good['id']) do |g|
  g.brand_name = business.brand_name
  g.business_id = business.id
  g.code = good['code']
  g.detail_info = good['detailInfo']
  g.evaluate_count = good['evaluateCount']
  g.free_ship_num = good['freeShipNum']
  g.freight = good['freight']
  g.logo = good['logo']
  g.market_price = good['marketPrice']
  g.min_buy_num = good['minBuyNum']
  g.name = good['name']
  g.price = good['price']
  g.sale_count = good['saleCount']
  g.share_amount = good['shareAmount']
  g.share_times = good['shareTimes']
  g.share_tips = good['shareTips']
  g.source_flag = good['sourceFlag']
  g.start_time = good['startTime']
  g.status = good['status']
  g.stock_num = good['stockNum']
  g.thum_logo = good['thumLogo']
  g.valid_end_time = good['validEndTime']
  g.whole_num = good['wholeNum']
  g.whole_price = good['wholePrice']
end
