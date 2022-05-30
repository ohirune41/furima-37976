window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("profit");
    addTaxDom.innerHTML = inputValue - Math.floor(inputValue / 10)
  })
})
