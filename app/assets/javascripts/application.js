// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets


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
    return "<tr><td><strong>"+this.user.email+"</strong> says: "+this.content+"</td><td><a data-confirm='Are you sure?'' rel='nofollow' data-method='delete' href='/comments/"+self.id+"'>delete</a></td></tr>";
  }
}




