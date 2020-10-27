function calc (){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    priceNum = itemPrice.value;
    let num = 10;
    tax = priceNum / num;
    addTaxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${priceNum - tax}`;
  });
}

setInterval(calc, 1000);
