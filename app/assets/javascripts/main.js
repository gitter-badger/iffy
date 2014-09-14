var iffyApp = angular.module('iffyApp',[]);

iffyApp.controller('searchController', function($scope){

	$scope.searches = [
		{
			term: '',
			limit: '',
			sort: '',
			category_filter: '',
			location: '',
			radius_filter: '',
		}
	]
}); //end of controller

/*
var x = document.getElementById("demo");


function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser. Please enter your zipcode";
    }
}

function showPosition(position) {
    x.innerHTML=position.coords.latitude +
    ", " + position.coords.longitude;	
}
*/