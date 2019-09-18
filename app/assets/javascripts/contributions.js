// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// const BASE_URL = 'http://localhost:3000'

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
