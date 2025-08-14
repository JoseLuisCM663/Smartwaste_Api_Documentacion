# Proceso ETL (Extracción, Transformación y Carga)

<hr>

## 📚 Importación de librerías

```python
import pandas as pd
import numpy as np
from sqlalchemy.orm import Session
from app.models.lectura_sensor import LecturaSensor
from app.models.bitacora_contenedor import BitacoraContenedor
from app.models.bitacora_recolecion import BitacoraRecoleccion
```

Descripción:

* **pandas** → manipulación y análisis de datos, creación de DataFrames.
* **numpy** → operaciones numéricas y estadísticas.
* **SQLAlchemy (Session)** → conexión y consulta de la base de datos.
* **modelos de la app** → acceso a las tablas de sensores y bitácoras para extracción de datos.

---

## 💾 Carga de datos

```python
# Extracción de lecturas de sensor
lecturas = db.query(LecturaSensor).filter(LecturaSensor.Sensor_Id == sensor_id).all()

# Extracción de bitácoras
recolecciones = db.query(BitacoraRecoleccion).all()
contenedores = db.query(BitacoraContenedor).all()
```

Descripción:
Los datos se cargan desde la base de datos hacia memoria para ser transformados y limpiados.

---

## 📃 Creación de DataFrame

```python
# Lecturas de sensor
df = pd.DataFrame([{"ID": l.ID, "Valor": l.Valor, "Fecha": l.Fecha} for l in lecturas])

# Bitácoras
df_recoleccion = pd.DataFrame(data_recoleccion)
df_contenedor = pd.DataFrame(data_contenedor)
```

Descripción:
Se convierten las listas de registros en **DataFrames de pandas** para manipulación y análisis.

---

## 🔎 Análisis exploratorio de los datos (EDA)

```python
df.head()
df.info()
df.describe()
df['Valor'].value_counts()
df['Hora'].hist()
```

Descripción:
Se analiza la estructura, distribución y tipos de datos para entender el dataset antes de limpieza y transformación.

---

## 🧩 Limpieza de datos

```python
# Eliminar duplicados
df = df.drop_duplicates(subset=["Fecha"], keep="first")

# Filtrado de valores válidos
df = df[df["Valor"].notna()]
df["Valor"] = df["Valor"].clip(lower=0, upper=100)

# Resampleo e interpolación
df = df.set_index("Fecha")
df = df.resample("5T").mean()
df["Valor"] = df["Valor"].interpolate(method="time")
```

Descripción:
Se depuran duplicados, valores nulos o fuera de rango, y se asegura consistencia temporal mediante resampleo e interpolación.

---

## 📊 Visualización de datos

```python
# Ejemplo de gráficas
df['Valor'].plot(title='Valores del sensor a lo largo del tiempo')
df['Hora'].value_counts().plot(kind='bar', title='Distribución por hora')
df['DiaSemana'].value_counts().plot(kind='bar', title='Distribución por día de la semana')
```

Descripción:
Se generan gráficas para visualizar volumen, categorización y patrones significativos de los datos.

*(Aquí se pueden agregar de 2 a 5 gráficos adicionales según análisis.)*

---

## 💾 Exportación del DataSet (.csv)

```python
# Lecturas de sensor
df.to_csv(f"datos/lecturas_sensor_{sensor_id}.csv", index=False)

# Bitácoras en CSV y ZIP
df_recoleccion.to_csv("datos/bitacora_recoleccion_etl.csv", index=False)
df_contenedor.to_csv("datos/bitacora_contenedor_etl.csv", index=False)
```

Descripción:
Se generan archivos CSV limpios que servirán para alimentar algoritmos de aprendizaje supervisado y no supervisado.

---

## ✍️ Conclusión de esta fase

El proceso ETL permitió:

* Extraer datos de sensores y bitácoras desde la base de datos.
* Transformar y limpiar datos asegurando consistencia temporal y valores válidos.
* Crear features relevantes como hora y día de la semana.
* Generar archivos CSV listos para análisis y entrenamiento de modelos de Machine Learning.

*(Espacio para agregar conclusiones adicionales o hallazgos de EDA.)*

