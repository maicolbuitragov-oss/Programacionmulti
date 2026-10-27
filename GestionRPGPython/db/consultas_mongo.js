
 // RPG Manager - Consultas MongoDB

// 1. Mostrar todos los personajes
db.personajes.find({});

// 2. Buscar personajes con nivel mayor que 13
db.personajes.find({ nivel: { $gt: 13 } });

// 3. Mostrar solo nombre y clase, ocultando _id
db.personajes.find(
    {},
    { nombre: 1, clase: 1, _id: 0 }
);

// 4. Ordenar personajes por nivel de mayor a menor
db.personajes.find().sort({ nivel: -1 });

// 5. Mostrar nombre y nivel de personajes con nivel mayor que 13,
//    ordenados de mayor a menor nivel
db.personajes.find(
    { nivel: { $gt: 13 } },
    { nombre: 1, nivel: 1, _id: 0 }
).sort({ nivel: -1 });
