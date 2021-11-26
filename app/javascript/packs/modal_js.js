const modal = document.querySelector('.modal-background');
const opener = document.querySelector('#modal-displayer');
const closer = document.querySelector('.X');

function closeModal() {
  modal.style.visibility = 'hidden';
}

function callp() {
  modal.style.visibility = 'visible';
}

opener.onclick = callp
closer.onclick = closeModal

console.log("this is loading")