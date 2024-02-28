const { faker } = require("@faker-js/faker");
const mysql = require("mysql");
// console.log(faker.internet.email());
// console.log(faker.date.past());
//root
//mysql

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "join_us",
});
// Selecting data
// const q = 'SELECT * FROM users';
// connection.query(q, function(error, results, fields){
// 	if(error) throw error;
// 	console.log(results);
// });

// Inserting data
// const q = 'INSERT INTO users(email) VALUES ("rusty_the_dog@gmail.com")';
// connection.query(q, function(error, results, fields){
// 	if(error) throw error;
// 	console.log(results);
// });

//Inserting data using object
// const person = {
// 	email: faker.internet.email(),
// 	created_at: faker.date.past()
// 	};
// console.log(person);
// const end_result = connection.query('INSERT INTO users SET ?',person, function(err, results){
// 	if(err) throw err;
// 	console.log(results);
// });

//Inserting lots of data ============================================
// const data = [];
// for(let i=0; i<500; i++){
// 	data.push([
// 		faker.internet.email(),
// 		faker.date.past()
// 	]);
// }

// console.log(data);
const q = "INSERT INTO users(email, created_at) VALUES ?";
const end_result = connection.query(q, [data], function (err, results) {
  if (err) throw err;
  console.log(results);
});
console.log(end_result.sql);

connection.query(q, function (error, results, fields) {
  if (error) throw error;
  console.log(results);
});
connection.end();
