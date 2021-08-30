
document.addEventListener("turbolinks:load", () => {
    sortRows()

    toggleConfirmation("#user_password", "#user_password_confirmation")

    formInline()

    progressBar()
})
