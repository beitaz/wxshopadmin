adverts = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'adverts.json')))
adverts['list'].each do |ad|
  Advert.create(title: ad['title'],
                pic_url: ad['picUrl'],
                advert_url: ad['advertUrl'],
                promo_pic_url: ad['promoPicUrl'],
                promo_tips: ad['promoTips'],
                promo_desc: ad['promoDesc'],
                category: ad['type'],
                sort: ad['sort'],
                status: ad['status'],
                present_amout: ad['presentAmout'],
                limit_fowards: ad['limitFowards'],
                limit_price: ad['limitPrice'],
                location: ad['locationFlag'],
                deleted: ad['isdeleted'])
end
