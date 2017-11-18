function showArticles(event) {
  event.preventDefault();

  if (document.getElementById('toggle').style.display == ''){
    document.getElementById('toggle').style.display = 'block';
    document.getElementById('show-hide-text').innerHTML = 'Hide planned articles';
  }
  else{
    document.getElementById('toggle').style.display = '';
    document.getElementById('show-hide-text').innerHTML = 'Show planned articles';
  }
};
