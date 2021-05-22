import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('personalized_trainer_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
