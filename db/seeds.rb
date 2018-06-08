table_names = %w(
  users
  books
  favorits
)
table_names.each do |table_name|
  path = Rails.root.join('db', 'seeds', "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{Rails.env} #{table_name}...."
    require(path)
  end
end