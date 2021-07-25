# encoding: UTF-8
#
require 'nkf'
require 'romkan'
require 'awesome_print'

# 文字のコードポイントを取得
a = 'あ'.codepoints[0]
n = 'ん'.codepoints[0]

(a..n).each do |c|
  moji = c.chr(Encoding::UTF_8) 
  #print "'#{moji}', "
end

hiragana = [
  'あ', 'い', 'う', 'え', 'お', 
]

#hiragana = [
#  'あ', 'い', 'う', 'え', 'お', 
#  'か', 'が', 'き', 'ぎ', 'く', 'ぐ', 'け', 'げ', 'こ', 'ご', 
#  'さ', 'ざ', 'し', 'じ', 'す', 'ず', 'せ', 'ぜ', 'そ', 'ぞ', 
#  'た', 'だ', 'ち', 'ぢ', 'つ', 'づ', 'て', 'で', 'と', 'ど', 
#  'な', 'に', 'ぬ', 'ね', 'の', 'は', 'ば', 'ぱ', 'ひ', 'び', 
#  'ぴ', 'ふ', 'ぶ', 'ぷ', 'へ', 'べ', 'ぺ', 'ほ', 'ぼ', 'ぽ', 
#  'ま', 'み', 'む', 'め', 'も', 
#  'や', 'ゆ', 'よ', 
#  'ら', 'り', 'る', 'れ', 'ろ', 
#  'わ', 'を', 'ん'
#]


puts '<s>	[] sp_S'
puts '</s> [] sp_S'

hiragana.each {|h|
  roma = h.to_roma
  roary = roma.chars

  yomi = ""

  case roary.size
  when 1 then
    yomi += "#{roary[0]}_B"
  when 2 then
    yomi += "#{roary[0]}_B "
    yomi += "#{roary[1]}_E"
  when 3 then
    yomi += "#{roary[0]}#{roary[1]}_B "
    yomi += "#{roary[2]}_E"
  else
    abort
  end

  puts "#{h} [#{h}] #{yomi}"
}
