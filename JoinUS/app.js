const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");

const app = express();
app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + "/public"));
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "join_us",
});
app.get("/", function (_, res) {
  // Find count of users in DB
  const q = "SELECT COUNT(*) AS count FROM users";
  connection.query(q, function (err, results) {
    if (err) throw err;
    const count = results[0].count;
    // Respond with the count
    // res.send("We have "+count+" users in our db" );
    res.render("home", { data: count });
  });
  // res.send("You've reached the home page!");
  console.log("SOMEONE REQUESTED US!!");
});
app.get("/joke", function (_, res) {
  const joke =
    "What do you call a dog that does magic trick? A labracadabrador";
  res.send(joke);
  console.log("Requested the joke!");
});
app.get("/random_num", function (_, res) {
  const num = Math.floor(Math.random() * 10) + 1;
  res.send("Your lucky number is " + num);
  console.log("SOMEONE REQUESTED US!!");
});
app.post("/register", function (req, res) {
  const person = {
    email: req.body.email,
  };
  console.log(person);
  connection.query("INSERT INTO users SET ?", person, function (err) {
    if (err) throw err;
    res.redirect("/");
  });
  console.log("POST request sent by /register email is");
});
app.listen(3000, function () {
  console.log("Server is running on port 3000");
});
