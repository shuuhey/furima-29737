function profitCalc(){

  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

    priceInput.addEventListener('keyup', function(){
      const value = priceInput.value;
      let fee = value * 0.1
      let gains = value - fee
      addTax.textContent = fee;
      profit.textContent = gains;
    });
}

window.addEventListener('load', profitCalc);