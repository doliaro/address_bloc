require_relative '../models/address_book.rb'

RSpec.describe AddressBook do 
    context "attributes" do
        it "should respond to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end

        it "should intialize entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_a(Array)
        end

        it "should intialize entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq 0
        end
    end

    context "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '505.310.1241', 'ada@gmail.com')
            expect(book.entries.size).to eq 1
        end

        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '505.310.1241', 'ada@gmail.com')
            new_entry = book.entries[0]

            expect(new_entry.name).to eq 'Ada Lovelace'
            expect(new_entry.phone_number).to eq '505.310.1241'
            expect(new_entry.email).to eq 'ada@gmail.com'
        end
    end

    context "#remove_entry" do
        it "removes one entry from the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '505.310.1241', 'ada@gmail.com')
            expect(book.entries.size).to eq 1

            book.remove_entry('Ada Lovelace', '505.310.1241', 'ada@gmail.com')
            expect(book.entries.size).to eq 0
        end
    end
end