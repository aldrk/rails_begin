function toggleConfirmation (passEl, confirmationEl) {
    const password = document.querySelector(passEl)
    const passwordConfirmation = document.querySelector(confirmationEl)
    const correct = document.querySelector(".octicon-check-circle");
    const inCorrect = document.querySelector(".octicon-x-circle");
    console.log(passwordConfirmation, password)

    const listener = (e) => {
        console.log(e.target.value)

        if (e.target.value.length) {
            if (e.target.value !== password.value) {
                inCorrect.classList.remove("hide");
                correct.classList.add("hide");
            } else {
                inCorrect.classList.add("hide");
                correct.classList.remove("hide");
            }
        } else {
            inCorrect.classList.add("hide");
            correct.classList.add("hide");
        }
    }

    passwordConfirmation.addEventListener("input", listener)
}
