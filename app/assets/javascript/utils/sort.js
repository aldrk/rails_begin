function sortRows() {
    const control = document.querySelector(".sort-by-title")

    control?.addEventListener("click", sortRowsByTitle)
}

function sortRowsByTitle()  {
    const table = document.querySelector('table')
    const rows = table.querySelectorAll("tr")

    const sortedRows = []

    for (let i = 1; i < rows.length; i ++) {
        sortedRows.push(rows[i])
    }

     if (this.querySelector(".octicon-arrow-up").classList.contains("hide")) {
         sortedRows.sort(compareRowsAsc)
         this.querySelector(".octicon-arrow-up").classList.remove("hide")
         this.querySelector(".octicon-arrow-down").classList.add("hide")
     } else {
         sortedRows.sort(compareRowsDesc)
         this.querySelector(".octicon-arrow-up").classList.add("hide")
         this.querySelector(".octicon-arrow-down").classList.remove("hide")
     }

    const sortedTable = document.createElement('table')
    sortedTable.classList.add("table")
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i ++) {
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)
}


const compareRowsAsc = (row1, row2) => {
    const rowTestTitle1 = row1.querySelector("td").textContent
    const rowTestTitle2 = row2.querySelector("td").textContent

    if (rowTestTitle1 < rowTestTitle2) return -1
    if (rowTestTitle1 > rowTestTitle2) return  1
    return 0
}

const compareRowsDesc = (row1, row2) => {
    const rowTestTitle1 = row1.querySelector("td").textContent
    const rowTestTitle2 = row2.querySelector("td").textContent

    if (rowTestTitle1 < rowTestTitle2) return 1
    if (rowTestTitle1 > rowTestTitle2) return -1
    return 0
}