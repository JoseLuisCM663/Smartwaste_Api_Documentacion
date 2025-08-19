# 🧱 Propuesta de Datawarehouse - SmartWasteWeb

## 📌 Contexto de un Datawarehouse en el Proyecto

Un Datawarehouse (almacén de datos) es un sistema que integra información desde diversas fuentes para su análisis y consulta en la toma de decisiones. En SmartWasteWeb, un datawarehouse serviría para concentrar datos históricos de sensores, rutas de recolección, alertas, mantenimientos y reportes ciudadanos.

Fuentes principales en el proyecto:

📦 Datos de sensores: nivel, temperatura, humedad, batería.

🗺️ Rutas de recolección: recorridos, horarios, distancias.

🔔 Alertas generadas automáticamente por el sistema.

🛠️ Mantenimiento de contenedores.

👥 Reportes ciudadanos (si se integran en futuro).

## 🎯 Propuesta de 3 Orígenes de Datos Alternativos

📊 Datos Meteorológicos

Fuente: APIs públicas como OpenWeatherMap.

Uso: Analizar si clima (lluvia, calor) influye en el llenado.

📊 Censos Poblacionales

Fuente: INEGI u otros organismos.

Uso: Correlacionar zonas de alta densidad con generación de residuos.

📊 Eventos Locales

Fuente: Calendarios cívicos o eventos comunitarios.

Uso: Detectar aumentos temporales en residuos por festividades.

## 💡 5 Experimentos de Asociación de Datos

✅ Llenado vs Temperatura Ambiente

Hipótesis: A mayor temperatura, mayor descomposición y frecuencia de uso.

✅ Humedad Sensor vs Clima Real

Hipótesis: Verificar si humedad en sensores es por clima o fugas.

✅ Nivel vs Horarios de Recolección

Hipótesis: Rutas mal planificadas generan sobrellenado antes de recolección.

✅ Densidad Poblacional vs Cantidad de Alertas

Hipótesis: Zonas más habitadas generan más problemas.

✅ Eventos vs Generación de Residuos

Hipótesis: Días festivos → picos de residuos en plazas o parques.

## 🌐 Toma de Decisiones (5 Supuestos)

Si el clima influye en el llenado, las rutas podrían ajustarse según pronóstico.

Si zonas densamente pobladas generan más residuos, se asignarán más contenedores.

Si hay humedad anormal sin lluvia, se planificará revisión técnica.

Si eventos generan aumentos, se agregarán rutas temporales.

Si alertas coinciden con zonas pobladas, se refuerza la supervisión visual y mantenimiento.

El datawarehouse permitiría mezclar todos estos datos y generar análisis más inteligentes y estratégicos para hacer de SmartWaste un sistema verdaderamente inteligente y adaptativo.