const progressBar = () => {
    const progressBar = document.querySelector(".my-progress-bar");
    const el = progressBar.children[0];
    const progressValue = progressBar.dataset.progressBar;

    el.style.width = `${400 * progressValue - 2}px`;
}