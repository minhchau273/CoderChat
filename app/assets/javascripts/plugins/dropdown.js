window.setupButton = function() { 
    (function() {
        "use strict";
        var dropdown = document.getElementById('dropdown'),
            content = document.getElementById('content'),
            button = document.getElementById('button');

        var number_of_children = content.children.length;
        var content_height = 39 * number_of_children;

        button.onclick = function () {

            if (dropdown.style.height === content_height + "px") {
                dropdown.style.height = "0";
                content.style.opacity = "0";
            } else {
                dropdown.style.height = content_height + "px";
                dropdown.style.transition = "height 0.5s";
                content.style.transition = "opacity 0.5s";
                content.style.opacity = "1";
            }
        };
    })();
};

$(document).on("page:change", window.setupButton)
