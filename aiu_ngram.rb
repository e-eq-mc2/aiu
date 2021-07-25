# encoding: UTF-8
#
require 'nkf'
require 'romkan'
require 'awesome_print'

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

hnum = hiragana.size
puts "\\data\\"
puts "ngram 1=#{hnum + 2}"
#puts "ngram 2=#{hnum + 1 + hnum * hnum}"
puts "ngram 2=#{hnum + 1}"

puts "" 

puts "\\1-grams:"

puts "-0.1 </s>"
puts "-99	<s>"

hiragana.each {|h|
  s = -0.1
  s = -0.1 if ( ['あ', 'い', 'う', 'え', 'お'].include? h ) 
  s = -0.1 if ( ['さ', 'し', 'す', 'せ', 'そ'].include? h ) 

  puts "#{s} #{h}"
}

puts "" 
puts "\\2-grams:"
puts "-99 <s> </s>"
hiragana.each {|h|
  s = -0.1
  s = -0.1 if ( ['あ', 'い', 'う', 'え', 'お'].include? h ) 
  s = -0.1 if ( ['さ', 'し', 'す', 'せ', 'そ'].include? h ) 

  puts "#{s} <s> #{h}"
}

#hiragana.each {|h0|
#  hiragana.each {|h1|
#    s = -99
#    puts "#{s} #{h0} #{h1}"
#  }
#}


puts ""
puts "\\end\\"
