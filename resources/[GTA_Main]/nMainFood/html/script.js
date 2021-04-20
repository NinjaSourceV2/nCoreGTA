function updateProgressHunger(hunger, value) {
    hunger.querySelector(".progressfill").style.width = `${value}%`;
}


function UpdateProgressWater(water, value) {
    water.querySelector(".progressfill").style.width = `${value}%`;
}

function display(bool) {
    if (bool) {
        $(".progress-hunger").show();
        $(".progress-water").show();
    } else {
        $(".progress-hunger").hide();
        $(".progress-water").hide();
    }
}

const pHungerBar = document.querySelector(".progress-hunger");
const pWaterBar = document.querySelector(".progress-water");

window.addEventListener('message', function(event) {
    if (event.data.type == "hunger") {

        (event.data.data_hudOn ? display(true) : display(false))
        updateProgressHunger(pHungerBar, event.data.data_faim)
        UpdateProgressWater(pWaterBar, event.data.data_soif)
    }
})