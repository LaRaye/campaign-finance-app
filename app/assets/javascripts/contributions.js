// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

const BASE_URL = 'http://localhost:3000'

class CnTrbn {
  constructor(contribution) {
    this.id = contribution.id
    this.amount = contribution.amount
    this.date = contribution.date
    this.candidate = contribution.candidate
    this.contributor = contribution.contributor
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
    </form><br><br>
  `
  contributionFormDiv.innerHTML = html;
}

function createContribution() {
  const contribution = {
    // creating new contributors/candidates objects from form???
    contributor: document.getElementById('contributor_name').value,
    candidate: document.getElementById('candidate_name').value,
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
    document.querySelector("#main ul").innerHTML += `<li>${contribution.contributor.name} donated ${contribution.amount}</li>`;
    let contributionFormDiv = document.getElementById('contribution_form');
    contributionFormDiv.innerHTML = '';
  })
}

function getContributions() {
  let link = document.querySelector(".contribution_link")
  let main = document.getElementById('main');

  link.addEventListener("click", function(event){
    event.preventDefault();

    fetch('/contributions')
      .then(resp => resp.json())
      .then(contributions => {
        main.innerHTML = '<ul>';
        main.innerHTML += contributions.map(contribution => `<li>${contribution.contributor.name} donated ${contribution.amount}</li>`)
        main.innerHTML += '</ul>'
      })
  })
}
