# frozen_string_literal: true

namespace :promotion_code do
  desc 'プロモーションコードを生成するタスク'
  task generate: :environment do
    promotion_codes = (1..10).map do
      PromotionCode.new(
        code: (0..9).to_a.concat(('a'..'z').to_a).sample(7).join,
        educed_price: rand(100..1000)
      )
    end
    PromotionCode.import promotion_codes
  end
end
