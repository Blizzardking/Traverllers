"use strict";
var validatePasswordField = function(fieldElem, infoMessage, validateFn) {
    var span = $("<span>" + infoMessage + "</span><br/>"),
        showInfo = function(fieldElem) {
            var valid = validateFn(fieldElem);
            if (!valid) {
                span.text("Invalid");
                span.removeClass().addClass("alert-danger  pull-right");
            } 
            else {
                span.text("Valid");
                span.removeClass().addClass("alert-success  pull-right");
            }
        };
    span.addClass("alert-info pull-right");
    span.text(infoMessage);
    fieldElem.after(span);
    fieldElem.blur(function() {
        if (fieldElem.val() != "") {
            showInfo(fieldElem);
        } else {
            span.addClass("alert-info pull-right");
            span.text(infoMessage);
        }
    });
};

var validateField = function(fieldElem, infoMessage, validateFn) {
    var span = $("<span>" + infoMessage + "</span><br/>"),
        showInfo = function(fieldElem) {
            var valid = validateFn(fieldElem);
            if (!valid) {
                span.text("Invalid");
                span.removeClass().addClass("alert-danger  pull-right");
            } 
            else {
                $.ajax({
                    type: "GET",
                    url: "check-user/" + fieldElem.val(),
                    dataType: "json",
                    success: function(result){
                        if(result) {
                            span.text("Valid");
                            span.removeClass().addClass("alert-success  pull-right");
                        } else {
                            span.text("Email is already taken");
                            span.removeClass().addClass("alert-danger  pull-right");
                        }
                    }
                });
            }
        };
    span.addClass("alert-info pull-right");
    span.text(infoMessage);
    fieldElem.after(span);
    fieldElem.blur(function() {
        if (fieldElem.val() != "") {
            showInfo(fieldElem);
        } else {
            span.addClass("alert-info pull-right");
            span.text(infoMessage);
        }
    });
};

$(document).ready(function() {
        var password = $( "#user_password" ),
        validatePasswordFn = function(fieldElem) {
            var str = fieldElem.val();
            return str.length < 8 ? false : true;
        },
        email = $( "#user_email" ),
        validateEmailFn = function(fieldElem) {
            var str = fieldElem.val();
            return str.indexOf('@') === -1 ? false: true;
        };   
    validatePasswordField(password, "At least 8 characters long", validatePasswordFn);
    validateField(email, "A @ character is required", validateEmailFn);

});
