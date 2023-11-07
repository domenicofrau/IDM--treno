let search = document.getElementById("criteriaForm")
let searchIcon = document.getElementById("searchIcon");
let closeIcon = document.getElementById("closeIcon");
let visible = false;

searchIcon.addEventListener("click", () => {
	
	if(!visible){
	search.classList.remove("d-none");	
	} else {
		search.classList.add("d-none");
	}
	visible = !visible;	
})


