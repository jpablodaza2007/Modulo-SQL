use Cursos

db.alumno.insert({
nombre: "Juan Pérez",
edad: 22,
carrera: "Estadística"
})

db.createCollection("cursos")

show collections

 --db.cursos.drop()

db.cursos.insert([
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

db.cursos.find({nombre: "Probabilidad II"})

db.curso.find({
creditos: 10,
nombre: "Probabilidad II"
})

{
nombre: "Probabilidad II",
creditos: 10,
horas: {
teoria: 6,
practica: 4
}
}

db.curso.find({"horas.practica": 4})

db.curso.find({
"horas.practica": 4,
creditos: 10
})

db.curso.findOne({
"horas.practica": 4
})

db.curso.find(
{}, // Criterios de búsqueda (vacío = todos)
{
nombre: 1,
creditos: 1,
_id: 0
}
)