# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :shell do
  watch /^(lib\/.+)\.rl$/ do |m|
    `ragel -Ilib/ragel -R #{m[0]} -o #{m[1]}.rb`
  end
end
