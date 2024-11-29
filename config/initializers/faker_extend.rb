Faker::JapaneseMedia::Conan.module_eval do
  def self.movie
    fetch('conan.movies')
  end
end
