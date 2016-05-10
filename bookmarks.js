/*  TODO: Add Function Blocks

 */

var db = require('./db');

/**
 *
 * Selects all books and then renders the page with the list.ejs template
 */
var list = module.exports.list = function(req, res) {
  // db.query('SELECT * from books ORDER BY id', function(err, books) {
  //   if (err) throw err;
    console.log('reurst made');
    res.render('books/list', {});
  
};

/**
 *
 * Selects information about passed in book and then
 * renders the delete confirmation page with the delete.ejs template
 */
module.exports.confirmdelete = function(req, res){
  var id = req.params.book_id;
  db.query('SELECT * from books WHERE id =  ' + id, function(err, book) {
    if (err) throw err;
    res.render('books/delete', {book: book[0]});
  });
};

/**
 *
 * Renders the add page with the add.ejs template
 */
module.exports.add = function(req, res) {
  res.render('books/add');
};

/**
 *
 * Selects information about the passed in bood and then
 * renders the edit confirmation page with the edit.ejs template
 */
module.exports.edit = function(req, res) {
  var id = req.params.book_id;
  db.query('SELECT * from books WHERE id =  ' + id, function(err, book) {
    if (err) throw err;

    res.render('books/edit', {book: book[0]});
  });
};

/**
 * Deletes the passed in book from the database.
 * Does a redirect to the list page
 */
module.exports.delete = function(req, res) {
  var id = req.params.book_id;
  db.query('DELETE from books where id = ' + id, function(err){
    if (err) throw err;
    res.redirect('/books');
  });
};

/**
 * Adds a new book to the database
 * Does a redirect to the list page
 */
module.exports.insert = function(req, res){
  var url = db.escape(req.body.url);
  var name = db.escape(req.body.name);
  var description = db.escape(req.body.description);
  var keywords = db.escape(req.body.keywords);

  var queryString = 'INSERT INTO books (url, name, description, keywords) VALUES (' + url + ', ' + name + ', ' + description + ', ' + keywords + ')';
  db.query(queryString, function(err){
    res.redirect('/books');
  });
};

/**
 * Updates a book in the database
 * Does a redirect to the list page
 */
module.exports.update = function(req, res){
  var id = req.params.book_id;
  var url = db.escape(req.body.url);
  var name = db.escape(req.body.name);
  var description = db.escape(req.body.description);
  var keywords = db.escape(req.body.keywords);

  var queryString = 'UPDATE books SET url = ' + url + ', name = ' + name + ', description = ' + description + ', keywords = ' + keywords + ' WHERE id = ' + id;
  db.query(queryString, function(err){
    if (err) throw err;
    res.redirect('/books');
  });
};