# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Item.create(
#   name: 'Tシャツ',
#   description: '白い無地のTシャツです。',
#   price: 1000
# )

# Item.create(
#   name: 'パーカー',
#   description: '白い無地のパーカーです。',
#   price: 1500
# )

# Item.create(
#   name: 'ソックス',
#   description: '黒い無地のソックスです。',
#   price: 500
# )

# Item.create(
#   name: '紫色のスカート',
#   description: '紫無地のスカートです。',
#   price: 2500,
#   image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/fashion_skirt4_purple.png'), filename: 'skirt_image.png')
# )

# Item.where('id=1').update(image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/fashion_tshirt5_blue.png'), filename: 'tshirt_image.png'))
# Item.where('id=2').update(image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/parka6_pink.png'), filename: 'parka_image.png'))
# Item.where('id=3').update(image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/kids_kutsushita_girl.png'), filename: 'socks_image.png'))

 Item.create(
   name: '黒色のTシャツ',
   description: '黒無地の通気性の良いTシャツです。',
   price: 1500,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/fashion_tshirt2_black.png'), filename: 'black_tshirt_image.png')
 )

 Item.create(
   name: '黄色いキャップ',
   description: '小学生向けの黄色いキャップです。',
   price: 3500,
   image: ActiveStorage::Blob.create_and_upload!(io: File.open('app/assets/images/fashion_tsuugakubou_cap.png'), filename: 'yellow_cap_image.png')
 )
