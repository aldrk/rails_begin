const timer = () => {
    const timerContainer = document.querySelector(".timer")
    const time = timerContainer?.dataset.leftTime

    let minutesCount = Math.floor(time?.split(".")[0] / 60)
    let secsCount = time?.split(".")[0] % 60

    const timeString = document.createElement("p")
    const nextBtn = document.getElementById("next-button")

    if (minutesCount < 1) {
        timerContainer.style.color = "red"
    }

    const fixedMin = minutesCount < 10 ? "0" + minutesCount : minutesCount
    const fixedSec = secsCount < 10 ? "0" + secsCount : secsCount

    timeString.innerText = `${fixedMin}:${fixedSec}`
    timerContainer.appendChild(timeString)

    const startTimer = () => {
        const intervalId = setInterval(() => {
            secsCount--
            if (secsCount < 0 && minutesCount > 0) {
                minutesCount--
                secsCount = 59
            }

            if (minutesCount < 1) {
                timerContainer.style.color = "red"
            }

            if (secsCount < 0 && minutesCount === 0) {
                clearInterval(intervalId)

                nextBtn?.click()
            }

            const fixedMin = minutesCount < 10 ? "0" + minutesCount : minutesCount
            const fixedSec = secsCount < 10 ? "0" + secsCount : secsCount

            timeString.innerText = `${fixedMin}:${fixedSec}`
        }, 1000)
    }

    startTimer()
}



