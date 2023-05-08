module Library where
import PdePreludat

--Cuantas muzzas
type Pizza = String
type Porciones = Number
type Pedido = (Pizza, Porciones)
type PizzaEntera = Number

lasDeMuzza :: [Pedido] -> [Pedido]
lasDeMuzza = filter esDeMuzza

esDeMuzza :: Pedido -> Bool
esDeMuzza = (=="muzza").fst

porciones :: [Pedido] -> Porciones
porciones = sum.(map snd)

cantidadPizzas :: Porciones -> PizzaEntera
cantidadPizzas = ceiling.(/8)

cuantasMuzzas :: [Pedido] -> PizzaEntera
cuantasMuzzas = cantidadPizzas.porciones.lasDeMuzza


--Tecnicas de combate

type HorasEntrenamiento = Number
type Poder = Number
type Objetivo = String
type Fortaleza = Number
type Presion = Number

--Punto 1
presionDeGolpe :: HorasEntrenamiento -> Objetivo -> Presion
presionDeGolpe horasEntrenamiento objetivo = poderDeGolpe horasEntrenamiento / fortalezaObjetivo objetivo

poderDeGolpe :: HorasEntrenamiento -> Poder
poderDeGolpe = (*15)

fortalezaObjetivo :: Objetivo -> Fortaleza
fortalezaObjetivo = (*2).length


--Punto 2
gomuGomuElephantGatling :: Objetivo -> Presion
gomuGomuElephantGatling = presionDeGolpe 180

golpesNormalesConsecutivos :: Objetivo -> Presion
golpesNormalesConsecutivos = presionDeGolpe 240

--Punto 3
esDificil :: Objetivo -> Bool
esDificil = (<100).gomuGomuElephantGatling

esAccesible :: Objetivo -> Bool
esAccesible = (between 200 400).golpesNormalesConsecutivos.focalizar

between :: Number -> Number -> Number -> Bool
between menor mayor nro = nro > menor && nro < mayor

focalizar :: Objetivo -> Objetivo
focalizar = take 7
