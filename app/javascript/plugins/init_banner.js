import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Be an inspiration. Don’t be a brat, burn that fat."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
