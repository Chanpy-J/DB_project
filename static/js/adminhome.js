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

