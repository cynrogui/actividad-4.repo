# CALCULAR MEDIDAS DE TENDENCIA CENTRAL Y REALIZAR HISTOGRAMA
-------------------------------------------------------------
  # 1 CARGAR LIBRERIAS ----
#Cargar paquetes
library(readr)
library(dplyr)
library(ggplot2)

# 2 CARGAR DATASET DESDE ARCHIVO CSV ----
print("Cargando dataset desde archivo csv")

#Especificar la ruta del archivo csv
archivo.csv <- "salarios_mujeres.csv"

# 3 CARGAR LOS DATOS EN UN DATAFRAME ----

datos <- read_csv(archivo.csv)

# 4 EXPLORAR EL DATASET ----
print("Explorando el dataset")

# Ver primeras filas para visualizar las variables del dataset
print("Visualizar las primeras 6 filas:")
head(datos)

# Visualizar la información general del dataset
print("Esructura general del dataset:")
str(datos)

# Visualizar las dimensiones del dataset
print("Dimensiones del dataset:")
dim(datos)

# Nombres de las columnas
print("nombres de las columnas:")
names(datos)

# Resúmen estadístico del dataset
print ("Resúmen estadístico de las variables:")
summary(datos)

# 5 CALCULAR MEDIDAS DE TENDENCIA CENTRAL ----
# Ver promedio y media de Edad

media <-mean(datos$Edad, na.rm = TRUE)
print("Promedio de edades:")
print(media)

mediana <-median(datos$Edad, na.rm = TRUE)
print("Mediana de las edades:")
print(mediana)

# Ver promedio y media de Salario

media <-mean(datos$Salario, na.rm = TRUE)
print("Promedio de los salarios:")
print(media)

mediana <-median(datos$Salario, na.rm = TRUE)
print("Mediana de los salarios:")
print(mediana)


# 5 LIMPIEZA DE LOS DATOS ----
print("Limpiando los datos")

# Convertir la columna de salarios a numérico y después eliminar NA
datos$Salario <- as.numeric(datos$Salario)

# Verificar si hay valores NA
print("Número de valores NA en la columna Salario después de la limpieza:")
colSums(is.na(datos))

# Reemplazar valores NA de Salario con el promedio (media)
datos$Salario[is.na(datos$Salario)] <- mean(datos$Salario, na.rm = TRUE)

# Verificar la sustitución de los valores NA
print("Número de valores NA en la columna después de sustituirlos por el promedio:")
colSums(is.na(datos))

# 6 REALIZAR UN HISTOGRAMA DE LA FRECUENCIA DE SALARIOS
ggplot(datos, aes(x = Salario)) +
  geom_histogram(binwidth = 3000, fill = "yellow", color = "blue", alpha = 1) +
  labs(title = "Distribución de salarios", x = "Variable numérica", y = "Frecuencia")
