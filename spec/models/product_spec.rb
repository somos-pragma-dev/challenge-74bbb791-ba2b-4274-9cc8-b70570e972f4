require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'es válido con atributos correctos' do
    product = Product.new(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
    expect(product).to be_valid
  end

  it 'no es válido sin nombre' do
    product = Product.new(price: 10, stock: 100, category: 'Categoría 1')
    expect(product).to_not be_valid
  end

  it 'no es válido con nombre duplicado' do
    Product.create(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
    product = Product.new(name: 'Producto 1', price: 20, stock: 200, category: 'Categoría 2')
    expect(product).to_not be_valid
  end

  it 'no es válido con precio negativo' do
    product = Product.new(name: 'Producto 1', price: -10, stock: 100, category: 'Categoría 1')
    expect(product).to_not be_valid
  end
end