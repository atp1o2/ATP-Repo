require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'recall.db'
)

# Tables
ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include?'notes'
    create_table :notes do |t|
      t.string  :content
      t.boolean :complete
      t.timestamps
    end
  end
end

# Models
class Note < ActiveRecord::Base

end


# Accesses every note and stores in a @notes
get '/' do
  @notes = Note.all
  @title = "All Notes"
  erb :home
end

# Adding a Note to the Database
post '/' do
  n = Note.new
  n.content = params[:content]
  n.save
  redirect '/'
end

# editing a note
# we've set the edit link to the note.id
# note finished
get '/' do
  @note = Note.get params[:id]
  @title = "Edit note ##{params[:id]}"
  erb :edit
end

put '/:id' do
  n = Note.get params[:id]
  n.content = params[:content]
  n.complete = params[:complete] ? 1 : 0
  n.updated_at = Time.now
  n.save
  redirect '/'
end






