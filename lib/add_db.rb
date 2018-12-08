require 'sequel'
require 'pg'

db = URI.parse(ENV['DATABASE_URL'])
DB = Sequel.connect(adapter: :postgres, host: db.host, user: db.user, database: db.database, password: db.password)

DB.create_table :posts do
  primary_key :id
  String :title
  String :text, text: true
  String :image
  Integer :lang
end