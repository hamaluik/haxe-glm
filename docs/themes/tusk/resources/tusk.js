(function (window, document) {
	// insert the navigation
	var nav = document.getElementsByTagName("nav")[0];
	var navTree = nav.getElementsByTagName("ul")[0];
	console.log(dox);
	navTree.innerHTML = navContent.replace(/\:\:rootPath\:\:/g, dox.rootPath);

	// highlight the current nav item
	var navLinks = navTree.getElementsByTagName("a");
	for (var i = 0; i < navLinks.length; i++) {
		if(navLinks[i].href === location.href && navLinks[i].className !== 'nav-toggle') {
			navLinks[i].className = "active";
		}
	};

	// toggle controls for the navigation
	var navToggles = document.getElementsByClassName("nav-toggle");
	for (var i = 0; i < navToggles.length; i++) {
		// see if it has any active children
		var actives = navToggles[i].parentElement.getElementsByClassName("active");
		// if it doesn't hide its ul
		if(actives.length === 0) {
			var uls = navToggles[i].parentElement.getElementsByTagName("ul");
			for (var n = 0; n < uls.length; n++) {
				uls[n].style.display = 'none';
			};
		}
		// otherwise, change its chevron
		else {
			var icon = navToggles[i].parentElement.getElementsByTagName("i")[0];
			icon.className = 'fa fa-chevron-down';
		}

		// add a click listener to toggle things
		navToggles[i].addEventListener("click", function() {
			var ul = this.parentElement.getElementsByTagName("ul")[0];
			var icon = this.parentElement.getElementsByTagName("i")[0];
			ul.style.display = ul.style.display == 'none' ? 'block' : 'none';
			icon.className = ul.style.display == 'none' ? 'fa fa-chevron-right' : 'fa fa-chevron-down';
		});
	};
})(this, this.document);