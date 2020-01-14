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

  def total_inventory
    total_inv = []
    # use vendor.check_stock(??) ???
    @vendors.each do |vendor|
      total_inv << vendor.inventory
    end
    #
    # total = {}
    # total_inv.reduce({}) do |acc, (k,v)|
    #   require "pry"; binding.pry
    # end
    total_inv
  end
end
