# frozen_string_literal: true

# This class represents the inventory of a boutique.
class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  # Returns the names of all items in the inventory, sorted alphabetically.
  def item_names
    items.sort_by { |item| item[:name] }.map { |item| item[:name] }
  end

  # Returns all items in the inventory that are cheaper than 30.
  def cheap
    items.select { |item| item[:price] < 30 }
  end

  # Returns all items in the inventory that are out of stock.
  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  # Returns the stock for the given item.
  def stock_for_item(name)
    items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  # Returns the total stock of all items in the inventory.
  def total_stock
    items.map { |item| item[:quantity_by_size].values.sum }.sum
  end

  private

  attr_reader :items
end
