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


### Aplicación del Mecanismo
Comandos que permitan aplicar los algoritmos al dataset generado en la fase de ETL.


### 📊 Gráficos Generados

- Dispersión de predicción vs. real

-- Para validar qué tan preciso es el modelo.

- Tendencia de llenado por día/hora

-- Para observar patrones de acumulación en distintos horarios.

- Comparación de eficiencia de rutas

--Antes vs después de aplicar predicciones al sistema de recolección.

---

### Resultados Obtenidos
Una vez aplicado los alogitmos demostrar los resultados obtenidos con su interpretación al contexto del proyecto


### Conclusión de la Fase del Proyecto.
Redacción general de la importancia de esta fase , así cómo de la importancia de los resultados obtenidos







