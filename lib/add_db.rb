require 'sequel'
require 'pg'

DB = Sequel.connect(adapter: :postgres, database: 'zug', host: 'localhost')

DB.create_table :posts do
  primary_key :id
  String :title
  String :text, text: true
  String :image
  Integer :lang
end