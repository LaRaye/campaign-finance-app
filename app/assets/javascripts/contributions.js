// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

const BASE_URL = 'http://localhost:3000'

function getContributions() {

  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL + '/contributions.json')
  .then(resp => resp.json())
  .then(contributions => {
    main.innerHTML += contributions.map(contribution => '<li><a href ="#" data-id="$(contribution.id)">${contribution.contributor_name} donated ${contribution.amount} on ${contribution.date}</a></li>')
    main.innerHTML += '</ul>'
  })
}
