# require modules here

def load_library(file)
  require "yaml"
  library = YAML.load_file(file)
  emoticon_library = {}
  library.each do |description, all_emoticons|
    if emoticon_library[description] == nil 
      emoticon_library[description] = {}
    end 
    all_emoticons.each do |emoticon|
      if emoticon_library[description] == {}
        emoticon_library[description][:english] = emoticon
      else 
        emoticon_library[description][:japanese] = emoticon
      end
    end
  end 
  emoticon_library
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  library.each do |meaning, all_languages|
    all_languages.each do |language, inner_emoticon|
      if inner_emoticon == emoticon
        return meaning
      end
    end 
  end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, western_emoticon)
  library = load_library(file_path)
  library.each do |meaning, all_languages|
    all_languages.each do |language, inner_emoticon|
      if inner_emoticon == western_emoticon
        return library[meaning][:japanese]
      end 
    end 
  end 
  return "Sorry, that emoticon was not found"
end