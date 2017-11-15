function showArticles(event) {
  event.preventDefault();

  if (document.getElementById('toggle').style.display == ''){
    document.getElementById('toggle').style.display = 'block';
  }
  else{
    document.getElementById('toggle').style.display = '';
  }
};
