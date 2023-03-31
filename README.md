# Cuitar

Agrega la clase `Cuit` que permite validar y formatear una CUIT (Clave Única de
Identificación Tributaria argentina).

## Instalación

Agregar en el Gemfile de la aplicación

```ruby
gem 'cuitar'
```

Y luego ejecutar:

    $ bundle install

O manualmente ejecutando en la línea de comando:

    $ gem install cuitar

## Uso

Se crea el objecto Cuit de la siguiente forma:

```ruby
cuit_number = '20228518310' # o '20-22851831-0' o 20228518310

cuit = Cuit.new(cuit_number)

cuit.to_s # => '20-22851831-0'
```

`cuit_number` puede pasarse de cualquiera de las siguientes tres formas:

* Un `String` conteniendo los 11 números que componen una CUIT.

* Un `String` conteniendo los 11 números que componen una CUIT, formateado con guiones.

* Un `Integer` comprendido por los 11 números que componen una CUIT.

Instanciar la clase `Cuit` con una CUIT inválida genera un `ArgumentError`

```ruby
cuit_number = 123

cuit = Cuit.new(cuit_number) # => Invalid CUIT (ArgumentError)
```

Es posible validar una CUIT

```ruby
Cuit.valid?(123) # => false

Cuit.valid?(20228518310) # =>  #<Cuit:0x000000010f589930 @check_digit=0, @cuit="20228518310", @dni="22851831", @type="20">
```


## Contribuciones

Reporte de errores y pull requests son bienvenidos en https://github.com/srabuini/cuitar.


## Licencia

Disponible como open source bajo los términos de [MIT License](https://opensource.org/licenses/MIT).
