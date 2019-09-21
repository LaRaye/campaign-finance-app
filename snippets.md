function getContributions() {
  clearForm();

  let table = document.getElementById('table');
  displayContributionsTable(table);

  // fetch(BASE_URL + '/contributions.json')
  // .then(resp => resp.json())
  // .then(contributions => {
  //   main.innerHTML += contributions.map(contribution => '<li><a href ="#" data-id="$(contribution.id)"></a> ${contribution.amount}</li>')
  //   main.innerHTML += '</table>'
  // })
}

function displayContributionsTable(table) {
  let tHead = table.createTHead();
  let tRow = tHead.insertRow(0);
  tRow.insertCell(0).appendChild(document.createTextNode("Candidate"));
  tRow.insertCell(1).appendChild(document.createTextNode("Contribution"));
  tRow.insertCell(2).appendChild(document.createTextNode("Contributor"));
  tRow.insertCell(3).appendChild(document.createTextNode("Date"));
}

// <table class="table">
//   <thead>
//     <tr>
//       <th>Candidate</th>
//       <th>Contribution</th>
//       <th>Contributor</th>
//       <th>Date</th>
//     </tr>
//   </thead>
//
//   <tbody>
//     <% @contributions.each do |c| %>
//       <tr>
//         <td><%= link_to c.candidate_name, candidate_path(c.candidate) %></td>
//         <td><%= link_to c.amount, contribution_path(c) %></td>
//         <td><%= link_to c.contributor_name, contributor_path(c.contributor) %></td>
//         <td><%= c.date %></td>
//       </tr>
//     <% end %>
//   </tbody>
// </table>

<a href="#" onclick="displayCreateForm(); return false;"List a New Contribution</a>

const BASE_URL = 'http://localhost:3000'

// function displayCreateForm() {
//   let contributionFormDiv = document.getElementById('contribution-form');
//   let html = `
//
//   `
// }

function getContributions() {
  clearForm();

  let main = document.getElementById('main');
  main.innerHTML = '<ul>';
  fetch(BASE_URL + '/contributions.json')
  .then(resp => resp.json())
  .then(contributions => {
    main.innerHTML += contributions.map(contribution => '<li><a href ="#" data-id="$(contribution.id)">${contribution.amount}</a></li>')
    main.innerHTML += '</ul>'
  })
}

function clearForm() {
  let contributionFormDiv = document.getElementById('contribution-form');
  contributionFormDiv.innerHTML = '';
}


<a href ="#" data-id="$(contribution.id)">${contribution.contributor_name} donated ${contribution.amount} on ${contribution.date}</a>

function getCandidateContributions() {
  let link = document.querySelector(".candidate_contribution_link");
  let main = document.getElementById('candidate_main');

  console.log(this)
  debugger

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
