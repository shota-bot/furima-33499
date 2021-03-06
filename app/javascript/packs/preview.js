if (location.pathname.match("items/new") || location.pathname.match("items/edit")){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element");
      let itemElementNum = document.querySelectorAll('.image-element').length;

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('width', 200);
      blobImage.setAttribute('height', 200);

      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('id', 'item_image_${itemElementNum}');
      inputHTML.setAttribute('name', 'items_tag[images][]');
      inputHTML.setAttribute('type', 'file');


      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      ImageList.appendChild(imageElement);

      inputHTML.addEventListener('change', (e) =>{
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob);
      });
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
};