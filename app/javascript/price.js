const updatePriceInfo = () => {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;

  const tax = Math.floor(inputValue * 0.1);
  document.getElementById("add-tax-price").innerHTML = ` ${tax}`;

  const profit = Math.floor(inputValue * 0.9);
  document.getElementById("profit").innerHTML = ` ${profit}`;
};

window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", updatePriceInfo);
  updatePriceInfo(); 
});

window.addEventListener('turbo:render', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", updatePriceInfo);
});