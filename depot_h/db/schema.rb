# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 2) do

  create_table "products", :force => true do |t|
    t.column "title",       :string
    t.column "description", :text
    t.column "image_url",   :string
    t.column "price",       :decimal, :precision => 8, :scale => 2, :default => 0.0
  end

end
