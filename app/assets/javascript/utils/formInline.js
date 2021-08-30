const formInline = () => {
    const links = document.querySelectorAll(".form-inline-link")

    if (!links.length) return

    links.forEach(link => link.addEventListener("click", formInlineLinkHandler))

    const errors = document.querySelector(".resource-error")

    if (errors) {
        formInlineHandler(errors.dataset.resourceId)
    }
}

const formInlineLinkHandler = (event) => {
    event.preventDefault()

    const target = event.target
    const testId = target.dataset.testId

    formInlineHandler(testId)
}

const formInlineHandler = (testId) => {
    const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
    const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
    const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

    if (formInline?.classList.contains("hide")) {
        testTitle?.classList.add("hide")
        formInline?.classList.remove("hide")
        link ? (link.textContent = "Cancel") : null
    } else {
        testTitle?.classList.remove("hide")
        formInline?.classList.add("hide")
        link ? (link.textContent = "Edit") : null
    }
}