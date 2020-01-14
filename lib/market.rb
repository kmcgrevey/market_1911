class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item) == true
    end
  end

  def sorted_item_list
    items = @vendors.map do |vendor|
      vendor.inventory.keys.map { |key| key.name }
    end
    items = items.flatten.uniq
    items.sort_by { |item| item[0] }
  end
end
