const contextRoot = "/" + window.location.pathname.split( '/' )[1];

function addCheckOutPayment(paymentId){
	 const token = $("meta[name='_csrf_token']").attr("content");
    const parameterName = $("meta[name='_csrf_parameterName']").attr("content");
    $.ajax({
        url: contextRoot + "/check-out/payment/"+paymentId+ `?${parameterName}=${token}`,
        type: "POST",
        success: function(response) {
           location.href = "/CS545-Tokyo-Drifters-Final-Project/check-out/thank-you";
        },

        error: function(error){
            alert(JSON.stringify(error));
        }
    });
}

$(function(){
	$("#btnAddPayment").click(function(){
		 const radioValue = $("input[name='paymentType']:checked").val();
		 console.log(radioValue);
            if(radioValue){
				addCheckOutPayment(radioValue);
            }else{
				$(".error").html("<p style='color:red'>Please choose payment method.</p>")
			}
	})
})