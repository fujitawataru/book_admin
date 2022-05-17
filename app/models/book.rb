class Book < ApplicationRecord
    enum sales_status: {
        reservation: 0, #受付予約
        now_on_sale: 1, #発売中
        end_of_print: 2, #販売終了
    }

    scope :costly, -> { where("price > ?", 3000) }
    scope :written_about, ->(theme){ where("name like ?", "%#{theme}%") }
    scope :find_price, ->(price) { find_by(price: price) }


    belongs_to :publisher
    has_many :book_authors
    has_many :authors, through: :book_authors

    validates :name, presence: true
    validates :name, length: { maximum: 25 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    # validates do |book|
    #     if book.name.include?("exercise")
    #         book.errors[:name] << "I don't like exercise."
    #     end
    # end
end