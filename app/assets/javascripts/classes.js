// function User (name, email){
//   this.name = name;
//   this.email = email;
// }
// User.prototype.sayHello = function(){
//   console.log("Hello, my name is "+ this.name);
// }

class Genre {
  constructor(genreJSON) {
    this.name = genreJSON.name;
    this.id = genreJSON.id;
    this.books = genreJSON.books;
  }
 
  formatGenre() {
    return "<h4><a href='/genres/"+this.id+"'>"+this.name+" <span class='badge'>"+this.books.length+"</span></a></td></h4>";
  }
}

class Comment {
  constructor(commentJSON) {
    this.content = commentJSON.content;
    this.id = commentJSON.id;
    this.user_id = commentJSON.user_id;
    this.book_id = commentJSON.book_id;
    this.user = commentJSON.user;
  }
 
  formatComment() {
    return "<tr><td><strong>"+this.user.email+"</strong> says: "+this.content+"</td><td><a data-confirm='Are you sure?'' rel='nofollow' data-method='delete' href='/comments/"+this.id+"'>delete</a></td></tr>";
  }
}