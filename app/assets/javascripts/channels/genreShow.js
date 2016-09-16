function displayGenre(jsonURL){
	$.get(jsonURL)
		.success(function(response) {
			$("#genreName").html(response.name);
			$("#genreBooks").html("");
			$.each(response.books, function(key, book){
				$("#genreBooks").append("<a href='/users/"+book.user_id+"/books/"+book.id+"'>"+
				book.title+" - "+book.author+"</a><br>");
		});
	});
}

function genreShow(){
	var currentGenreID = parseInt($(".nextGenre").attr("data-id"));
	displayGenre(window.location.pathname+".json");
	$(".nextGenre").on("click", function(e) {
		e.preventDefault();
	    currentGenreID++;
	    displayGenre("/genres/" + currentGenreID + ".json");
	});
};