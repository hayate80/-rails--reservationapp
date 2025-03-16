document.addEventListener('turbolinks:load', function() {
  const mypageBtnContainer = document.getElementById('mypageBtnContainer');
  const mypageDropdown = document.getElementById('mypageDropdown');
  
if (!mypageBtnContainer){ return false;}

  mypageBtnContainer.addEventListener('click', function() {
      if (mypageDropdown.style.display === 'block') {
          mypageDropdown.style.display = 'none';
      } else {
          mypageDropdown.style.display = 'block';
      }
  });

});