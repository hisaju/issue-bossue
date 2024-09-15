import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["issueSelect"]

  onChange(event) {
    console.log(event.target.value)
    this.updateIssueOptions(event.target.value)
  }

  updateIssueOptions(repo_id) {
    fetch (`/user/bossues/issues.json?repo_id=${repo_id}`)
      .then(response => response.json())
      .then(data => {
        this.issueSelectTarget.innerHTML = ""
        data.forEach(issue => {
          let option = document.createElement("option")
          option.value = issue.id
          option.text = issue.title
          this.issueSelectTarget.appendChild(option)
        })
      })
  }
}
