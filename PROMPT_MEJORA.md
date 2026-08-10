# Prompt para Mejorar el Codigo Base

Copia y pega el siguiente contenido completo en un asistente de IA (Claude, ChatGPT, etc.)
para obtener un ZIP con el proyecto corregido y listo para compilar.

---

```
Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación o descripciones sin código, genera los archivos
correspondientes sin aplicar análisis de compilación
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:
// === ARCHIVO: app/models/product.rb ===
class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end

// === ARCHIVO: app/controllers/products_controller.rb ===
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Producto creado con éxito.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: 'Producto actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Producto eliminado con éxito.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :category)
  end
end

// === ARCHIVO: app/views/products/index.html.erb ===
<h1>Lista de Productos</h1>
<table>
  <tr>
    <th>Nombre</th>
    <th>Precio</th>
    <th>Stock</th>
    <th>Categoría</th>
    <th>Acciones</th>
  </tr>
  <% @products.each do |product| %>
    <tr>
      <td><%= product.name %></td>
      <td><%= product.price %></td>
      <td><%= product.stock %></td>
      <td><%= product.category %></td>
      <td><%= link_to 'Editar', edit_product_path(product) %> | <%= link_to 'Eliminar', product_path(product), method: :delete, data: { confirm: '¿Estás seguro?' } %></td>
    </tr>
  <% end %>
</table>
<%= link_to 'Nuevo Producto', new_product_path %>

// === ARCHIVO: app/views/products/new.html.erb ===
<h1>Nuevo Producto</h1>
<%= form_with(model: @product, local: true) do |form| %>
  <% if @product.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@product.errors.count, "error") %> prohibido la creación del producto:</h2>
      <ul>
        <% @product.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="field">
    <%= form.label :name %>
    <%= form.text_field :name %>
  </div>
  <div class="field">
    <%= form.label :price %>
    <%= form.number_field :price %>
  </div>
  <div class="field">
    <%= form.label :stock %>
    <%= form.number_field :stock %>
  </div>
  <div class="field">
    <%= form.label :category %>
    <%= form.text_field :category %>
  </div>
  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

// === ARCHIVO: app/views/products/edit.html.erb ===
<h1>Editar Producto</h1>
<%= form_with(model: @product, local: true) do |form| %>
  <% if @product.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@product.errors.count, "error") %> prohibido la actualización del producto:</h2>
      <ul>
        <% @product.errors.full_messages.each do |message| %>
          <li><%= message %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
  <div class="field">
    <%= form.label :name %>
    <%= form.text_field :name %>
  </div>
  <div class="field">
    <%= form.label :price %>
    <%= form.number_field :price %>
  </div>
  <div class="field">
    <%= form.label :stock %>
    <%= form.number_field :stock %>
  </div>
  <div class="field">
    <%= form.label :category %>
    <%= form.text_field :category %>
  </div>
  <div class="actions">
    <%= form.submit %>
  </div>
<% end %>

// === ARCHIVO: app/assets/stylesheets/application.css ===
body {
  font-family: Arial, sans-serif;
}
h1 {
  color: #333;
}
table {
  width: 100%;
  border-collapse: collapse;
}
table, th, td {
  border: 1px solid #ddd;
}
td, th {
  padding: 8px;
}
th {
  background-color: #f2f2f2;
}

// === ARCHIVO: spec/models/product_spec.rb ===
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

// === ARCHIVO: spec/controllers/products_controller_spec.rb ===
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

// === ARCHIVO: config/routes.rb ===
Rails.application.routes.draw do
  resources :products
end

// === ARCHIVO: db/migrate/20240722123456_create_products.rb ===
class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :stock
      t.string :category
      t.timestamps
    end
  end
end

// === ARCHIVO: bin/rails ===
#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/boot'
require 'rails/commands'

// === ARCHIVO: Gemfile ===
source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.1'
gem 'sqlite3', '~> 1.4.2'
gem 'rspec-rails', '~> 5.1.2', groups: [:development, :test]

// === ARCHIVO: spec/rails_helper.rb ===
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('dummy/config/environment.rb', __dir__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_stylesheets!
end
```
