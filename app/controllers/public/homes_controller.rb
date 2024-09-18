class Public::HomesController < ApplicationController
  def top
    # @genres = Genre.all ジャンルが追加できるようになったらこっち
    @genres = ['ケーキ', '焼き菓子', 'プリン', 'キャンディ']
  end

  def about
  end
end
