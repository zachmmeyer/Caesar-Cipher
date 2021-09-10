def character_alpha?(character_ordinal)
  (65..90).cover?(character_ordinal) || (97..122).cover?(character_ordinal) ? true : false
end

def alpha_character_above_range?(character_ordinal, shifted_ordinal)
  ((65..90).cover?(character_ordinal) && shifted_ordinal > 90) || 
  ((97..122).cover?(character_ordinal) && shifted_ordinal > 122) ? true : false
end

def alpha_character_below_range?(character_ordinal, shifted_ordinal)
  ((65..90).cover?(character_ordinal) && shifted_ordinal < 65) || 
  ((97..122).cover?(character_ordinal) && shifted_ordinal < 97) ? true : false
end

def caesar_cipher(phrase, shift_factor)
  until ((-26..26).cover?(shift_factor)) do
    shift_factor > 26 ? shift_factor -= 26 : shift_factor += 26
  end
  coded_phrase = Array.new
  phrase.chars.each do |char|
    character_ordinal = char.ord
    shifted_ordinal = character_ordinal + shift_factor 
    if character_alpha?(character_ordinal)
      if alpha_character_above_range?(character_ordinal, shifted_ordinal)
        coded_phrase.push((shifted_ordinal-26).chr)
      elsif alpha_character_below_range?(character_ordinal, shifted_ordinal)
        coded_phrase.push((shifted_ordinal+26).chr)
      else
        coded_phrase.push(shifted_ordinal.chr)
      end
    else
      coded_phrase.push(char)
    end
  end
  p coded_phrase.join("")
end

caesar_cipher("What a string!", 5)
caesar_cipher("I do believe this works quite as expected.", 26)
caesar_cipher("And what if I'm wrong? I dare-say I will EAT MY HAT!", -52)
caesar_cipher("Just for fun, let's go nuts.", -8000)
