import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

document.addEventListener('turbolinks:load', () => {
  console.log('test');
  $('.js-example-basic-multiple').select2({
    placeholder: 'Sélectionnez un ou plusieurs éléments',
    tags: true,
    tokenSeparators: [',', ' '],
  });
});
