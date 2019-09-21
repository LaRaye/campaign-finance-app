// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

class CnTrbn {
  constructor(contribution) {
    this.id = contribution.id
    this.amount = contribution.amount
    this.date = contribution.date
    this.candidate = contribution.candidate
    this.contributor = contribution.contributor
  }

  renderContribution() {
    return `<li> ${this.renderContributorLink()} donated $${this.amount} to ${this.renderCandidateLink()} on ${this.date}</li>`;
  }

  renderContributorLink() {
    return `<a href="#" data-id="${this.id}" class="contributor_link" onclick="displayContributor(); return false;">${this.contributor.name}</a>`
  }

  renderCandidateLink() {
    return `<a href="#" class="candidate_link" onclick="displayCandidate(); return false;">${this.candidate.first_name} ${this.candidate.last_name}</a>`
  }

  renderContributor() {
    let industry = this.checkIndustry();
    return `<p><strong>Contributor:</strong> ${this.contributor.name}</p>` + industry
  }

  checkIndustry() {
    if (`${this.contributor.industry_affiliation}` === 'null') {
      return `<p><strong>Industry Affiliation:</strong> Not Available</p>`
    } else {
      return `<p><strong>Industry Affiliation:</strong> ${this.contributor.industry_affiliation}</p>`
    }
  }

}

function displayCreateForm() {
  let contributionFormDiv = document.getElementById('contribution_form');
  let html = `
    <p>Fill In Below to List a New Contribution:</p>
    <form onsubmit="createContribution(); return false;">
      <label>Contributor Name: </label>
      <input type="text" id="contributor_name"><br><br>
      <label>Candidate Name: </label>
      <input type="text" id="candidate_name"><br><br>
      <label>Amount: </label>
      <input type="text" id="amount"><br><br>
      <label>Date: </label>
      <input type="text" id="date"><br><br>
      <input type="submit" value="New Contribution">
    </form>
  `
  contributionFormDiv.innerHTML = html;
}

function createContribution() {
  const contribution = {
    contributor_name: document.getElementById('contributor_name').value,
    candidate_name: document.getElementById('candidate_name').value,
    amount: document.getElementById('amount').value,
    date: document.getElementById('date').value
  }

  fetch('/contributions', {
    method: 'POST',
    body: JSON.stringify({ contribution }),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  })
  .then(resp => resp.json())
  .then(contribution => {
    const newContrib = new CnTrbn(contribution);
    document.querySelector("div#main").innerHTML += newContrib.renderContribution();
    let contributionFormDiv = document.getElementById('contribution_form');
    contributionFormDiv.innerHTML = '';
  })
}

function getContributions() {
  let link = document.querySelector(".contribution_link");
  let main = document.getElementById('main');

  link.addEventListener("click", function(event){
    event.preventDefault();

    fetch('/contributions')
      .then(resp => resp.json())
      .then(contributions => {
        main.innerHTML = '<ul>';
        main.innerHTML += contributions.map(contribution =>
          {const contrib = new CnTrbn(contribution)
          return contrib.renderContribution()}
        ).join('')
        main.innerHTML += '</ul>'
      })
  })
}

function displayContributor() {
  let links = document.querySelectorAll('a.contributor_link');
  let main = document.getElementById('main');

  links.forEach( function(link) {
    link.addEventListener("click", function(event){
      event.preventDefault();

      let linkId = link.getAttribute('data-id');

      fetch('/contributions/' + linkId)
        .then(resp => resp.json())
        .then(contribution => {
          const contrib = new CnTrbn(contribution)
          main.innerHTML = "";
          main.innerHTML += contrib.renderContributor()
        })
    })
  })
}

function displayCandidate() {

}
