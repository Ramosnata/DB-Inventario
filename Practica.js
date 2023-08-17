const user1 = {
    name: "Natalia",
    lastname: "Ramos",
    age: 21,
  showFullName() {
    return `${this.name} ${this.lastname}` //concatenar
    
   }
  }
  
  //constructor
  function Person() {
    this.name = ""
    this.lastname = ""
    this.age = 0
    this.showFullName = function () {
      return `${this.name} ${this.lastname}` //concatenar
    }
  }
  
  const user2 = new Person()
  user2.name = "Camilo"
  user2.lastname = "Ramos"
  user2.age = 20
  console.log(user2.showFullName())
  
  const user3 = new Person()
  user3.name = "Firulais"
  const user4 = new Person()
  const user5 = new Person()
  
  
  console.log (user3)
  console.log (user4)
  console.log (user5)

  ////////////////////////////////////////////////////////////////////////
  const user = {
    name: "Lukas",
    lastname: "Torres",
    age: 40,
    showName() {}
  }
    console.log (Object.keys(user)) //Permite ver la clave del objeto como name, lastname, age y showName
    console.log (Object.values(user)) //Permite ver los datos que tiene el objeto como Lukas, Torres, 40...


////////////////////////////////////////////////////////////////////////

    function Person(name, lastname) { // Esta funcion espera dos parametros que es el name y lastname
        this.name = name
        this.lastname = lastname
        this.displayname = function() { // El displayname va a retornar un string
          return `${this.name} ${this.lastname}`
        }
      
      }
      
      const jon = new Person("Jon","Perez")
      const maria = new Person("Maria","Castro")
      const pepito = new Person("Pepito","Torres")
      const nelly = new Person("Nelly","Suarez")
      
      Person.prototype.greet = function (){ //Este metodo prototype esta enlasado con el constructor alterandolo
        return `Hello I am ${this.name}`
      }
      
      console.log (jon.greet())
      console.log (maria.greet())
      console.log (pepito.greet())
      console.log (nelly.greet())

////////////////////////////////////////////////////////////////////////

//Este es otro ejemplo donde se altera el constructor permitiendo concatenar un texto con el otro esto es lo que
// ejecuta: hello world sorry
      const s = new String ("hello world ")

      String.prototype.concaTest = function() {
        return this + "sorry";
      }
      console.log (s.concaTest())

////////////////////////////////////////////////////////////////////////

// RELACION
class Person {
  constructor(name, lastname){
    this.name = name
    this.lastname = lastname
  }
}
const maria = new Person(`Maria`, `Perez`)
const lukas = new Person(`Lukas`, `Torres`)

lukas.parent = maria; //Asociación

console.log (maria)
console.log (lukas)
//7////////////////777777////////77
const company = {
  name: "fazt tech",
  employees: []
}
company.employees.push (maria) // Agregacion al arreglo empleados
company.employees.push (lukas) // Agregación
console.log (company)

//7////////////////777777////////77
//Principios de javascript
//Encapsulacion
function Company(name){ //Objeto tipico con una propiedad name
  let employees = [] //variable. Para llenar los datos de employess debo hacerlo a traves de un metodo ej: getEmployees
  this.name = name

  this.getEmployees = function(){  // Lo que va hacer es devolver los empleados que se tienen
    return employees
  } 
  
  this.addEmployee = function (employee) {
    employees.push(employee)
  }
}

const company = new Company ("coca cola")
const company2 = new Company ("pepsi")


console.log(company)
console.log(company2)

company.addEmployee ({name: "lukas"})
company2.addEmployee ({name: "Susan"})

console.log (company.getEmployees())
console.log (company2.getEmployees())

//7////////////////777777////////77
//Herencia
class Person {
  constructor(name, lastname){
    this.name = name
    this.lastname = lastname
  }
}

class Programer extends Person { //extends hereda de otro objeto que es de la clase person
  constructor (name, lastname, language){
    super(name, lastname); //para extraer las propiedades del objeto person
    this.language = language
  }
}

const person = new Person('Nata', 'Ramos')
const programer = new Programer('Lukas', 'Torres', 'JavaScipt')

console.log (person)
console.log (programer)