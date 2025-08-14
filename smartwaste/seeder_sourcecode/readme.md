# SEEDER
<hr>

## 📂 Código fuente
Repositorio de la API: [SmartWasteApi](https://github.com/JoseLuisCM663/SmartWasteApi)

---

## 🗄️ Respaldo de la BD vacía (sin datos generados)
Archivo de estructura de la base de datos (relacional):  
`/database/backups/smartwaste_empty.sql`  
*(Debe contener solo la estructura de tablas y relaciones sin datos)*

---

## 🔗 Listado de endpoints para generar datos simulados

| Método | Endpoint                       | Descripción                                                                 |
|--------|--------------------------------|-----------------------------------------------------------------------------|
| `POST` | `/seeder/generar-lecturas/`    | Genera lecturas simuladas para un sensor, con valores y tiempos configurables. |
| `POST` | `/seeder/bitacoras/`           | Genera bitácoras de recolección y sus registros asociados a contenedores.   |

---

## 🖼️ Screenshots (capturas de pantalla)

### 1. Endpoint `/seeder/generar-lecturas/`
![Generar lecturas](screenshots/seeder_generar_lecturas.png)

### 2. Endpoint `/seeder/bitacoras/`
![Generar bitácoras](screenshots/seeder_generar_bitacoras.png)

---

## 🗄️ Respaldo de la BD post llenado (1,000,000 de registros)
Archivo con datos generados para análisis supervisado y no supervisado:  
`/database/backups/smartwaste_filled.sql`

Este respaldo incluye:
- Usuarios (Admin, Usuario, Chofer)
- Rutas
- Contenedores
- Sensores
- Lecturas de sensores
- Bitácoras de recolección y contenedor

---

## ⚙️ Uso del Seeder principal
El script `config/seeder.py` permite generar datos de prueba:

```bash
python config/seeder.py --usuarios 3 --rutas 2 --contenedores 2 --sensores 2 --seed 42

