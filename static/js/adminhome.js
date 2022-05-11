var $DOM = $(document);
$DOM.on('click', '#TopSell', function() {

	console.log("TopSell clicked");

    query = $(".TopSell").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/TopSell?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});

var $DOM = $(document);
$DOM.on('click', '#icustomer', function() {

	console.log("icustomer clicked");

    query = $(".icustomer").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/icustomer?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});

var $DOM = $(document);
$DOM.on('click', '#ccustomer', function() {

	console.log("ccustomer clicked");

    query = $(".ccustomer").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/ccustomer?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});

var $DOM = $(document);
$DOM.on('click', '#correctclass', function() {

	console.log("correctclass clicked");

    query = $(".correctclass").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/correctclass?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});

var $DOM = $(document);
$DOM.on('click', '#couponissue', function() {

	console.log("couponissue clicked");

    query = $(".couponissue").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/couponissue?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});

var $DOM = $(document);
$DOM.on('click', '#pay', function() {

	console.log("pay clicked");

    query = $(".pay").val();
    $('.search_results').empty()
	$.ajax({
		type: 'get',
		url: '/pay?query=' + query,
		// url: '/search' + query,
		success: function(result) {
            console.log(result);
            $('.search_results').append(result)
		}
	});
});