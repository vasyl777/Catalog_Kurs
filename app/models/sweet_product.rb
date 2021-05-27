class SweetProduct < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :category_sweet_products
  has_many :categories, through: :category_sweet_products

  has_rich_text :description

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  # has_one :action_text_rich_text,
  #         class_name: 'ActionText::RichText',
  #         as: :record

  scope :sugar_substitute_true, -> { where(sugar_substitute: true) }
  scope :sugar_substitute_false, -> { where(sugar_substitute: false) }

  def category_names=(names)
    category_sweet_products.delete_all
    names.split(',').map(&:strip).uniq.each do |category_name|
      category_id = Category.find_or_create_by(name: category_name.to_s.downcase).id
      CategorySweetProduct.create(sweet_product_id: id, category_id: category_id)
    end
  end

  def category_names
    categories.map(&:name).join(' , ')
  end

  def set_image=(src)
    file = URI.parse(src).open
    image.attach(io: file, filename: name)
  rescue OpenURI::HTTPError => e
    pp e
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    sheet = spreadsheet.sheet(spreadsheet.sheets[0])
    header = sheet.row(sheet.first_row)
    (sheet.first_row + 1..sheet.last_row).each do |i|
      row = Hash[[header, sheet.row(i)].transpose]
      if row['id'].blank?
        sweet_product = SweetProduct.find_or_create_by(name: row['name'])
        row['id'] = sweet_product.id
      else
        sweet_product = SweetProduct.find_by(id: row['id'])
      end
      sweet_product.update(row)
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path)
    when '.xls' then Roo::Excel.new(file.path)
    when '.xlsx' then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
