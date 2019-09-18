// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// const BASE_URL = 'http://localhost:3000'

class Contrib {
  constructor(contribution) {
    this.id = contribution.id
    this.amount = contribution.amount
    this.date = contribution.date
    this.candidate = contribution.candidate
    this.contributor = contribution.contributor
  }
}

function displayCreateForm() {
  let contributionFormDiv = document.getElementById('contribution-form');
  let html `
    <form onsubmit="createContribution(); return false;">
      <label>Contributor Name: </label>
      <input type="text" id="contributor_name"<br/>
      <label>Candidate Name: </label>
      <input type="text" id="candidate_name"<br/>
      <label>Amount: </label>
      <input type="text" id="amount"<br/>
      <label>Date: </label>
      <input type="text" id="date"<br/>
    </form>
  `
  contributionFormDiv.innerHTML = html;
}



function getCandidateContributions() {
  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch('/contributions')
  .then(resp => resp.json())
  .then(contributions => {
    main.innerHTML += contributions.map(contribution => '<li>${contribution.amount}</li>')
    main.innerHTML += '</ul>'
  })
}

function getContributions() {

  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL + '/contributions.json')
  .then(resp => resp.json())
  .then(contributions => {
    main.innerHTML += contributions.map(contribution => '<li>${contribution.amount}</li>')
    main.innerHTML += '</ul>'
  })
}
