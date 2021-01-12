if (document.URL.match( /new/ ) || document.URL.match( /edit/ )){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width', 200);
      blobImage.setAttribute('height', 200);


      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    }

    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = document.querySelectorAll('img')[1];
      if (imageContent) {
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
};