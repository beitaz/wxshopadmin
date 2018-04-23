business = Business.first

detail = "<p><img src='http://sujiefs.com/upload/images/20180416/201804161444383598828.jpg' title='201804161444383598828.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161444414118828.jpg' title='201804161444414118828.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161444476895033.jpg' title='201804161444476895033.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161444530593595.jpg' title='201804161444530593595.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445004248636.jpg' title='201804161445004248636.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445257725338.jpg' title='201804161445257725338.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445257712097.jpg' title='201804161445257712097.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445258396627.jpg' title='201804161445258396627.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445258293022.jpg' title='201804161445258293022.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445432773465.jpg' title='201804161445432773465.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445558070760.jpg' title='201804161445558070760.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445558449948.jpg' title='201804161445558449948.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445558865404.jpg' title='201804161445558865404.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161445558726428.jpg' title='201804161445558726428.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446023846733.jpg' title='201804161446023846733.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446024575834.jpg' title='201804161446024575834.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446150144288.jpg' title='201804161446150144288.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446150231809.jpg' title='201804161446150231809.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446150440475.jpg' title='201804161446150440475.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446150675495.jpg' title='201804161446150675495.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446425393209.jpg' title='201804161446425393209.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446426279191.jpg' title='201804161446426279191.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446426027897.jpg' title='201804161446426027897.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446425933463.jpg' title='201804161446425933463.jpg'/></p>" +
         "<p><img src='http://sujiefs.com/upload/images/20180416/201804161446426655727.jpg' title='201804161446426655727.jpg'/></p>" +
         "<p><br/></p>"

10.times do |i|
  remainder = i.remainder(2)
  Good.create!(brand_name: business.brand_name,
    business_id: business.id, 
    code: 'T18C07' + i.to_s,
    detail_info: detail,
    discover: remainder == 0,
    recommend: remainder == 1,
    status: 1)
end