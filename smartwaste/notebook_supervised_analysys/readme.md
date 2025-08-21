### 🎯 Modelo de Aprendizaje Supervisado - Clasificación de Rutas Eficientes  

📋 Propuesta de Aplicación  
El modelo de aprendizaje supervisado se utiliza para **clasificar automáticamente rutas de recolección** en **Eficientes (1)** o **No Eficientes (0)**, tomando en cuenta los tiempos de duración y el porcentaje de recolección alcanzado.  
Este sistema permite:  

- ⏱️ **Medición de desempeño**: Determinar si una ruta cumple con los criterios de eficiencia establecidos.  
- 🗑️ **Optimización logística**: Identificar rutas que recolectan menos contenedores o con tiempos excesivos.  
- 📊 **Análisis comparativo**: Evaluar el impacto de los factores que más influyen en la eficiencia.  
- ⚡ **Automatización del análisis**: Generar gráficas y métricas sin intervención manual.  
- 🔮 **Base para predicciones futuras**: Servir como insumo para optimizar la planeación de rutas.  

---

🔧 Elección del Mecanismo a Utilizar  

**Algoritmo Principal:** Random Forest Classifier  

Se seleccionó **Random Forest** por las siguientes ventajas:  

✅ Maneja relaciones no lineales entre variables.  
✅ Es robusto frente a outliers y ruido en los datos.  
✅ Reduce el riesgo de overfitting al usar un ensamble de árboles.  
✅ Permite interpretar la importancia de cada característica.  
✅ Tiene un buen desempeño con datasets tabulares medianos.  

**Configuración del Modelo:**  


    clf = RandomForestClassifier(
    n_estimators=100,   # Número de árboles en el bosque
    random_state=42     # Reproducibilidad
    )   

## 📚 Marco Teórico

### Clasificación Supervisada
El aprendizaje supervisado utiliza datos etiquetados `(X, y)` para entrenar un modelo que prediga nuevas instancias.  
En este caso:

- **X** = Tiempo_Duración, Cantidad_Contenedores, Promedio_Llenado, Porcentaje_Recolectado  
- **y** = Etiqueta binaria `Eficiente` (1 si cumple reglas de negocio, 0 en caso contrario).  

---

### Random Forest para Clasificación
Random Forest combina múltiples árboles de decisión:

\[
\hat{y} = \text{mode}\{T_1(x), T_2(x), \dots, T_B(x)\}
\]

Donde:  
- \(\hat{y}\) = clase predicha final  
- \(B\) = número de árboles (aquí 100)  
- \(T_i(x)\) = predicción del árbol *i*  

---

### Matriz de Confusión

\[
\begin{bmatrix}
TN & FP \\
FN & TP
\end{bmatrix}
\]

**Métricas derivadas:**

- **Accuracy** = \((TP + TN) / Total\)  
- **Precision** = \(TP / (TP + FP)\)  
- **Recall** = \(TP / (TP + FN)\)  
- **F1** = \(2 \times \dfrac{Precision \times Recall}{Precision + Recall}\)  
---

### ⚡ Aplicación del Mecanismo

## Comando Principal (API FastAPI)

    curl -X POST http://localhost:8000/ml_supervisado/entrenar/

    Flujo de Ejecución del Endpoint


📂 Carga de datos desde CSVs limpios (bitácoras de rutas y contenedores).

🔄 Agregación de porcentajes y promedios por ruta.

🏷️ Generación de la etiqueta Eficiente según reglas de negocio.

✂️ Separación en train/test (70/30).

🌲 Entrenamiento del modelo Random Forest.

📊 Evaluación con matriz de confusión y métricas.

💾 Exportación de modelo (.pkl) y gráficas (.png).
---

### 📊 Gráficos Generados

Para documentar los resultados del modelo, se generan automáticamente:

Promedio llenado por clase <br>
![llenado](https://github.com/juuaaann456/imagenes/blob/f04065342c7cd9bdb85b08490d60bff718acf43d/imagenes/llenado.jpg)

Duración de rutas por clase
![duracion](https://github.com/juuaaann456/imagenes/blob/f04065342c7cd9bdb85b08490d60bff718acf43d/imagenes/duracion.jpg)

Matriz de Confusión del Modelo
![matriz](https://github.com/juuaaann456/imagenes/blob/f04065342c7cd9bdb85b08490d60bff718acf43d/imagenes/matriz.jpg)
---

### 📈 Resultados Obtenidos

Métricas Clave

1 .-Accuracy: 0.80 – 0.90 (típico en pruebas con dataset balanceado).

2 .-Precision/Recall: Dependerá del balance de clases.

3 .-Interpretación:

- Valores altos de TP (rutas correctamente clasificadas como eficientes) indican buen ajuste.

- Si hay demasiados FN (rutas eficientes clasificadas como ineficientes), se deben ajustar hiperparámetros.
  
      {
        "accuracy": 0.86,
        "graficas": [
        "hist_duracion.png",
        "box_lleno.png",
        "confusion.png"
            ]
        }

---
### 🎯 Conclusión de la Fase del Proyecto

Importancia de la Fase Supervisada
Este modelo supervisado representa un paso crítico en el proyecto, al permitir evaluar automáticamente la eficiencia de las rutas con base en evidencia cuantitativa.

Beneficios Clave Logrados:
🔮 Capacidad Predictiva: El sistema diferencia con precisión rutas eficientes e ineficientes.
📊 Optimización de Recursos: Ayuda a mejorar la planeación logística y asignación de unidades.
⚡ Automatización: Reduce el tiempo de análisis manual mediante generación automática de métricas y gráficas.
🎯 Toma de Decisiones Basada en Datos: Proporciona evidencia para la mejora continua del sistema de recolección.

Impacto en la Gestión de Rutas

Permite planificación estratégica de recorridos.

Mejora la asignación de recursos humanos y materiales.

Reduce costos y tiempos de operación al minimizar rutas ineficientes.

Proporciona indicadores clave para justificar decisiones en el contexto del proyecto SmartWaste.
  


