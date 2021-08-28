
document.addEventListener("turbolinks:load", () => {
    const control = document.querySelector(".sort-by-title")

    control?.addEventListener("click", sortRowsByTitle)

    toggleConfirmation("#user_password", "#user_password_confirmation");
})
