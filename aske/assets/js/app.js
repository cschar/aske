// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

var buttons = document.querySelectorAll(".pagebutton");

function displayAscii(data){
  var el = document.getElementById("ascii-display");
  el.innerHTML = "";

  data.forEach(function(asciiData){
    let pre = document.createElement('pre');
    pre.innerHTML = 'hey'
    pre.innerHTML = asciiData.text;
    el.appendChild(pre);
  })
}

buttons.forEach(function(button){
  button.addEventListener("click", function(x){
    
    let buttonNum = button.getAttribute('name')
    
    let url = window.js_map.hostname+"/api?page="+buttonNum

    fetch(url)
    .then( resp => (resp.json()))
    .then((payload) => {
      
      displayAscii(payload.data);
    })
    .catch((err) => console.log(err))
  })
})

