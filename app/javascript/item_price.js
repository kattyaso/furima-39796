const item_price = () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value, 10) || 0;
    const addTaxDom = document.getElementById("add-tax-price");

    const salesTaxRate = 0.1;
    const salesTax = Math.floor(inputValue * salesTaxRate);

    addTaxDom.textContent = salesTax.toLocaleString();

    // Calculate sales profit
    const addProfitDom = document.getElementById("profit");
    const salesProfit = inputValue - salesTax;

    addProfitDom.textContent = salesProfit.toLocaleString();
  });
};

window.addEventListener("turbo:load", item_price);
window.addEventListener("turbo:render", item_price);
