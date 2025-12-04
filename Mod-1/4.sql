show dbs
db
help
use BaseDatosJuanDaza

use BaseDatosJuanDaza
db
show dbs

db.alumnoJuanDaza.insert({
nombre: "Juan Alcazar",
edad: 22,
carrera: "Estadística"
})

use BaseDatosJuanDaza
db.dropDatabase()

show dbs

db.createCollection("cursosJuanDaza")

show collections

db.cursosJuanDaza.drop()

db.alumnoJuanDaza.find()

db.alumnoJuanDaza.find().pretty()

db.alumnoJuanDaza.find().pretty()

db.cursosJuanDaza.insert([
{
nombre: "Probabilidad II",
creditos: 10,
horas: { teoria: 6, practica: 4 }
},
{
nombre: "Estadística Inferencial",
creditos: 8,
horas: { teoria: 5, practica: 3 }
},
{
nombre: "Bases de Datos",
creditos: 12,
horas: { teoria: 4, practica: 8 }
}
])


db.cursosJuanDaza.find({nombre: "Probabilidad II"})

db.cursosJuanDaza.find({
creditos: 10,
nombre: "Probabilidad II"
})

db.cursosJuanDaza.find({"horas.practica": 4})

db.cursosJuanDaza.find({
"horas.practica": 4,
creditos: 10
})

db.cursosJuanDaza.findOne({
"horas.practica": 4
})

db.cursosJuanDaza.find(
{},
{
nombre: 1,
creditos: 1,
_id: 0
}
)


db.cursosJuanDaza.find().sort({nombre: 1}).pretty()

db.cursosJuanDaza.find().sort({creditos: 1})

db.cursosJuanDaza.find().sort({creditos: -1})

db.cursosJuanDaza.find().sort({
creditos: -1,
nombre: 1
})


db.cursosJuanDaza.find().limit(2)

db.cursosJuanDaza.find()
.sort({creditos: -1})
.limit(5)

db.cursosJuanDaza.count()

db.cursosJuanDaza.count({
creditos: {$gt: 8}
})

for(var i = 1; i <= 10; i++) {
db.estudiantesJuanDaza.insert({
nombre: "Estudiante " + i,
codigo: 1000 + i,
promedio: Math.random() * 5
})
}

function buscarPorCreditosJuanDaza(min, max) {
return db.cursosJuanDaza.find({
creditos: {$gte: min, $lte: max}
}).toArray()
}

db.coleccionJuanDaza.update(
{criterios_de_seleccion},
{operacion_de_actualizacion},
{opciones}
)


db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$set: {
departamento: "Estadística",
semestre: 4,
activo: true
}}
)


db.cursosJuanDaza.update(
{nombre: "Bases de Datos"},
{$set: {
creditos: 15
}}
)

db.cursosJuanDaza.update(
{nombre: "Bases de Datos"},
{$set: {
creditos: 15,
"horas.teoria": 5,
"horas.practica": 10,
actualizado: new Date()
}}
)

db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$inc: {creditos: 2}}
)

db.estudiantesJuanDaza.update(
{codigo: 1001},
{$mul: {beca: 1.1}}
)

db.estudiantesJuanDaza.update(
{codigo: 1001},
{$max: {notaMaxima: 4.5}}
)


db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$rename: {
"creditos": "numeroCreditos"
}}
)

db.cursosJuanDaza.update(
{},
{$rename: {
"creditos": "numeroCreditos",
"horas": "horasSemanales"
}},
{multi: true}
)


db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$unset: {
departamento: ""
}}
)

db.cursosJuanDaza.remove({
nombre: "Bases de Datos"
})

db.cursosJuanDaza.removeOne({
creditos: 10
})

db.cursosJuanDaza.remove({})


db.cursosJuanDaza.find({
creditos: {$gte: 10}
})

db.cursosJuanDaza.find({
creditos: {$lte: 8}
})

db.cursosJuanDaza.find({
nombre: {$ne: "Probabilidad II"}
})

db.cursosJuanDaza.find({
creditos: {$in: [8, 10, 12]}
})

db.cursosJuanDaza.find({
$and: [
{creditos: {$gte: 10}},
{"horas.practica": {$gte: 4}}
]
})

db.cursosJuanDaza.find({
$or: [
{creditos: 10},
{creditos: 12}
]
})

db.cursosJuanDaza.find({
creditos: {
$not: {$lte: 8}
}
})

db.cursosJuanDaza.find({
temas: "Probabilidad"
})

db.cursosJuanDaza.find({
temas: {
$all: ["Probabilidad", "Estadística"]
}
})

db.cursosJuanDaza.find({
temas: {$size: 5}
})

db.estudiantesJohanCastro.find({
notas: {
$elemMatch: {
$gte: 4.0,
$lte: 5.0
}
}
})

db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$push: {
temas: "Distribuciones"
}}
)

db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$pull: {
temas: "Distribuciones"
}}
)

db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$addToSet: {temas: "Probabilidad"}}
)

db.cursosJuanDaza.update(
{nombre: "Probabilidad II"},
{$pop: {temas: 1}}
)

db.cursosJuanDaza.createIndex({nombre: 1})

db.cursosJuanDaza.createIndex({
creditos: 1,
nombre: 1
})

db.cursosJuanDaza.getIndexes()


db.cursosJuanDaza.createIndex({
descripcion: "text",
nombre: "text"
})

db.cursosJuanDaza.find({
$text: {
$search: "probabilidad estadística"
}
})

db.cursosJuanDaza.find({
$text: {
$search: "\"probabilidad condicional\""
}
})


db.cursosJuanDaza.aggregate([
{$match: {creditos: {$gte: 10}}},
{$group: {_id: "$departamento", total: {$sum: "$creditos"}}},
{$sort: {total: -1}}
])


db.cursosJuanDaza.createIndex({nombre: 1})

db.cursosJuanDaza.createIndex({creditos: -1})

db.cursosJuanDaza.getIndexes()

db.empleadosJuanDaza.insert({
nombre: "Juan Daza",
apellido: "Alcazar",
email: "juan.daza@example.com",
departamento: "Desarrollo",
salario: 3500000,
fechaIngreso: new Date("2020-01-15"),
activo: true,
certificaciones: ["MongoDB", "JavaScript", "Node.js"]
})

db.empleadosJuanDaza.find()

db.empleadosJuanDaza.findOne({nombre: "Juan Daza"})

db.empleadosJuanDaza.update(
{nombre: "Juan Daza"},
{$set: {
salario: 4000000,
certificaciones: ["MongoDB", "JavaScript", "Node.js", "React"]
}}
)

db.empleadosJuanDaza.count()

db.empleadosJuanDaza.update(
{nombre: "Juan Daza"},
{$push: {
certificaciones: "Python"
}}
)

db.empleadosJuanDaza.find().sort({salario: -1})

db.empleadosJuanDaza.find(
{},
{nombre: 1, email: 1, _id: 0}
)

db.empleadosJuanDaza.find({
salario: {$gte: 3500000}
})

db.empleadosJuanDaza.find({
$and: [
{departamento: "Desarrollo"},
{salario: {$gte: 3000000}}
]
})

db.empleadosJuanDaza.update(
{nombre: "Juan Daza"},
{$pull: {
certificaciones: "JavaScript"
}}
)

db.empleadosJuanDaza.createIndex({nombre: 1})

db.empleadosJuanDaza.createIndex({
departamento: 1,
salario: -1
})

db.empleadosJuanDaza.createIndex({
certificaciones: "text",
departamento: "text"
})

db.empleadosJuanDaza.find({
$text: {
$search: "MongoDB"
}
})

db.empleadosJuanDaza.aggregate([
{$group: {
_id: "$departamento",
totalEmpleados: {$sum: 1},
salarioPromedio: {$avg: "$salario"}
}},
{$sort: {totalEmpleados: -1}}
])

db.empleadosJuanDaza.find({
certificaciones: {$size: 4}
})


db.empleadosJuanDaza.find({
salario: {
$gte: 3000000,
$lte: 5000000
}
})

db.empleadosJuanDaza.update(
{nombre: "Juan Daza"},
{$set: {
certificaciones: ["MongoDB Professional", "Node.js Expert", "Full Stack Developer"]
}}
)

db.empleadosJuanDaza.remove({
nombre: "Juan Daza"
})

db.createCollection("empleadosJuanDaza", {
validator: {
$jsonSchema: {
bsonType: "object",
required: ["nombre", "email", "departamento"],
properties: {
nombre: {bsonType: "string"},
email: {bsonType: "string"},
departamento: {bsonType: "string"},
salario: {bsonType: "number"},
certificaciones: {bsonType: "array"}
}
}
}
})
