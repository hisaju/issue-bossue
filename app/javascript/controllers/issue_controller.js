import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["issueSelect", "issueTitle", "issueContent"]

  onChange(event) {
    console.log(event.target.value)
    this.updateIssueOptions(event.target.value)
  }

  onSetIssue(event) {
    console.log(event.target.value)
    this.updateIssueDetail(event.target.value)
  }

  updateIssueOptions(repo_id) {
    fetch (`/user/bossues/issues.json?repo_id=${repo_id}`)
      .then(response => response.json())
      .then(data => {
        this.issueSelectTarget.innerHTML = ""
        data.forEach(issue => {
          let option = document.createElement("option")
          option.value = issue.number
          option.text = issue.title
          this.issueSelectTarget.appendChild(option)
        })
      })
  }

  updateIssueDetail(issue_number) {
    const repo_id = document.getElementById("repository_id").value
    console.log(repo_id)
    fetch (`/user/bossues/issues/${issue_number}.json?repo_id=${repo_id}`)
      .then(response => response.json())
      .then(data => {
        this.issueTitleTarget.value = data.title
        this.issueContentTarget.value = data.body
      })
  }
}
