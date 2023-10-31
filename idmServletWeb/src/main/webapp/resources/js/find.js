console.log("test")

let search = document.getElementById("search")
let searchIcon = document.getElementById("searchIcon");

searchIcon.addEventListener("click", () => {
	
	console.log(search.value);
	window.location.href = "http://localhost:8080/idmServletWeb/cerca-treno-nome?nome=" + search.value;
})