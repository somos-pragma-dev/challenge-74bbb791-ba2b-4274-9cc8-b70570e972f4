require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'retorna una respuesta exitosa' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'retorna una respuesta exitosa' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'con atributos válidos' do
      it 'crea un nuevo producto' do
        expect {
          post :create, params: { product: { name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1' } }
        }.to change(Product, :count).by(1)
      end
    end

    context 'con atributos inválidos' do
      it 'no crea un nuevo producto' do
        expect {
          post :create, params: { product: { name: '', price: 10, stock: 100, category: 'Categoría 1' } }
        }.to_not change(Product, :count)
      end
    end
  end

  describe 'GET #edit' do
    it 'retorna una respuesta exitosa' do
      product = Product.create(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
      get :edit, params: { id: product.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    context 'con atributos válidos' do
      it 'actualiza el producto' do
        product = Product.create(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
        put :update, params: { id: product.id, product: { name: 'Producto Actualizado' } }
        product.reload
        expect(product.name).to eq('Producto Actualizado')
      end
    end

    context 'con atributos inválidos' do
      it 'no actualiza el producto' do
        product = Product.create(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
        expect {
          put :update, params: { id: product.id, product: { name: '' } }
        }.to_not change { product.reload.name }
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'elimina el producto' do
      product = Product.create(name: 'Producto 1', price: 10, stock: 100, category: 'Categoría 1')
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
    end
  end
end