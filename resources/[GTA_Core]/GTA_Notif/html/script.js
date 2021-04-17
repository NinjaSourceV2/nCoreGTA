let max_timer_notif = 8000 //This will let the notif display for like 5 seconds.

function Notify(event) {
    (() => {

        //Create div id_notification this is the container for all the notification showed :
        const id_notification = document.createElement("div");
        let id = Math.random().toString(36).substr(2, 10);
        id_notification.setAttribute("id", id);
        id_notification.classList.add("notif");


        //Parent div "notification ..."
        const iconPosition = event.data.data_position
        const notification = document.createElement("div");
        notification.classList.add("notification", event.data.data_type);
        notification.style.flexDirection = iconPosition;


        //adding nested new div for the logo :
        const iconName = event.data.data_icon
        const mainIcon = document.createElement("div");
        mainIcon.classList.add("data_icon");
        mainIcon.innerHTML = '<i class="' + iconName + '"></i>';
        notification.innerText = event.data.data_text;

        //Main Container : 
        const notificationArea = document.getElementById("notification-area");

        //Parent system : 
        notification.appendChild(mainIcon);
        id_notification.appendChild(notification);
        notificationArea.appendChild(id_notification);


        //Sleep :
        setTimeout(() => {
            var notifications = notificationArea.getElementsByClassName("notif")

            for (let i = 0; i < notifications.length; i++) {
                if (notifications[i].getAttribute("id") == id) {
                    notifications[i].remove();
                    break;
                }
            }
        }, max_timer_notif);
    })();
}

window.addEventListener('message', function(event) {
    var audioPlayer = null;

    // Check for playSound
    if (event.data.transactionType == "playSound") {

        if (audioPlayer != null) {
            audioPlayer.pause();
        }

        audioPlayer = new Howl({ src: ["./sounds/" + event.data.transactionFile + ".ogg"] });
        audioPlayer.volume(event.data.transactionVolume);
        audioPlayer.play();
    }

    if (event.data.type == "notification_main") {
        if (event.data.activate == true) {

            //Check if the data_type is not a correct value from the table then we return an error : 
            if (!event.data.data_type.match(/^(warning|success|error)$/)) {
                fetch('http://GTA_Notif/error')
                return
            }

            //Allow player to have a sound when the notif pop pup :
            fetch('http://GTA_Notif/main')

            //Start the notification :
            Notify(event);
        }
    }
})