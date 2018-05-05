good = JSON.parse(File.read(Rails.root.join('tmp', 'data', 'detail.json')))

good['photoList'].each do |photo|
  Photo.find_or_create_by(good_id: photo['goodsId']) do |p|
    p.photo = photo['photo']
    p.thum_photo = photo['thumPhoto']
  end
end