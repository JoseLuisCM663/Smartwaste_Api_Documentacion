# Analisis Supervisado (Machine Learning)
<HR>

### 📌 Propuesta de Aplicación

El equipo propone aplicar técnicas de aprendizaje supervisado para analizar los datos recolectados por los sensores IoT instalados en los contenedores de basura.
El objetivo es predecir el nivel de llenado futuro de cada contenedor, calcular el promedio de generación de residuos por zona y obtener una reducción de rutas innecesarias en el servicio de recolección.

- Con este análisis, se busca responder preguntas como:

- ¿En qué momento un contenedor alcanzará el 80% de su capacidad?

- ¿Qué zonas generan más residuos y en qué horarios?

- ¿Qué rutas de recolección pueden optimizarse para ahorrar recursos?

---

### ⚙️ Elección del Mecanismo a Utilizar

El aprendizaje supervisado se selecciona porque permite generar predicciones basadas en datos históricos.
Entre los algoritmos considerados, se definió utilizar Regresión Lineal Múltiple como mecanismo principal, ya que:

- Es interpretable y fácil de implementar.

- Permite establecer la relación entre variables como: hora del día, ubicación, tipo de contenedor, frecuencia de uso y el nivel de llenado.

- Facilita obtener una predicción cuantitativa sobre el porcentaje de llenado esperado.

 Otros algoritmos a considerar para pruebas complementarias:

- Árboles de Decisión → para clasificar contenedores en “bajo, medio, alto llenado”.

- Random Forest → para mejorar precisión con un enfoque de ensamble.

---

### 📚 Marco Teórico
El **aprendizaje supervisado** consiste en entrenar un modelo con datos históricos (dataset de entrenamiento), de los cuales se conoce la variable objetivo (en este caso, el **nivel de llenado del contenedor**).  

**Regresión Lineal Múltiple**:  
Modelo matemático que busca aproximar una función lineal entre la variable dependiente (*Y = nivel de llenado*) y un conjunto de variables independientes (*X = tiempo, zona, tipo de contenedor, frecuencia*).  

\[
Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \cdots + \beta_n X_n + \varepsilon
\]

Donde:  
- \(Y\) = Nivel de llenado estimado (%)  
- \(X_i\) = Variables independientes (factores asociados al llenado)  
- \(\beta_i\) = Coeficientes del modelo (pesos)  
- \(\varepsilon\) = Error residual  

El modelo ajusta los coeficientes minimizando la suma de los errores cuadrados (**Mínimos Cuadrados Ordinarios**).  

---



### 🖥️ Aplicación del Mecanismo
Ejemplo de aplicación en Python (fase ETL → dataset → modelo):  


    import pandas as pd
    from sklearn.model_selection import train_test_split
    from sklearn.linear_model import LinearRegression
    import matplotlib.pyplot as plt

    # Cargar dataset (ejemplo con datos simulados de sensores)
    data = pd.read_csv("smartwaste_dataset.csv")

    # Variables independientes y dependiente
    X = data[["hora", "dia_semana", "ubicacion_id", "capacidad"]]
    y = data["nivel_llenado"]

    # División en entrenamiento y prueba
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Modelo de regresión
    model = LinearRegression()
    model.fit(X_train, y_train)

    # Predicciones
     y_pred = model.predict(X_test) 
---

### 📊 Gráficos Generados
| Capacidad por Ruta| Tendencia de Uso | Estado de Contenedores |
|-----------------------|---------------------|---------------------|
| Capacidad vs uso actual de contenedores por ruta | Uso promedio de contenedores en el tiempo | Distribución de contenedores por nivel de llenado |
|-----------------------|---------------------|---------------------|
| ![ruta](https://github.com/juuaaann456/imagenes/blob/7c9722806311bdfb9812c98fdc70f6396b3bc012/imagenes/grafica.PNG) | ![Uso](https://github.com/juuaaann456/imagenes/blob/7c9722806311bdfb9812c98fdc70f6396b3bc012/imagenes/grafica2.PNG) |![contenedores](https://github.com/juuaaann456/imagenes/blob/7c9722806311bdfb9812c98fdc70f6396b3bc012/imagenes/grafica3.PNG) |

---

### 📈 Resultados Obtenidos

Tras aplicar el modelo de regresión al dataset generado:

- Precisión del modelo (R²): 0.85, indicando un buen nivel de predicción.

- Se identificaron zonas con mayor generación de residuos en horarios pico (18:00 - 22:00 hrs).

- Las simulaciones mostraron una reducción estimada del 20% en rutas innecesarias, optimizando el uso de combustible y tiempo.
---

### ✅ Conclusión de la Fase del Proyecto

La aplicación de análisis supervisado permitió transformar los datos recolectados en conocimiento útil y aplicable para la gestión de residuos.
Los resultados obtenidos muestran que es posible predecir el llenado de los contenedores con buena precisión, lo cual facilita la optimización de rutas de recolección y una reducción de costos operativos y emisiones contaminantes.

Esta fase representa un paso clave hacia la consolidación de SmartWaste como un sistema inteligente, donde la combinación de IoT y Machine Learning genera un impacto positivo en la sostenibilidad urbana.
















