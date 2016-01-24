window.setupButton = function() { 
    (function() {
        "use strict";
        var dropdown = document.getElementById('dropdown'),
            content = document.getElementById('content'),
            button = document.getElementById('button');

            button.onclick = function () {

                if (dropdown.style.height === "117px") {
                    dropdown.style.height = "0";
                    content.style.opacity = "0";
                } else {
                    dropdown.style.height = "117px";
                    dropdown.style.transition = "height 0.5s";
                    content.style.transition = "opacity 0.5s";
                    content.style.opacity = "1";
                }
            };
    })();
};

$(document).on("page:change", window.setupButton)
