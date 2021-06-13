$(function() {
    function display(bool) {
        if (bool) {
            $(".main-container").show();
        } else {
            $(".main-container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;

        if (item.type === "identiter") {
            if (item.activate == true) {
                $("#nom").text(item.data_nom + " " + item.data_prenom);
                $("#origine").text(item.data_origine);
                $("#age").text(item.data_age + "ans");
                $("#profession").text(item.data_travail);
                $("#telephone").text(item.data_telephone);
                display(true);
            } else {
                display(false);
            }
        }
    })
})