var stars;

document.body.addEventListener("click", function(e) {
  if (e.target.id.includes("star")) {
    stars = e.target.value;
  }
});

function addRate(film_id) {
  if (stars != undefined) {
    fetch("/ratefilm", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        stars,
        film_id
      })
    })
      .then(() => {
        location.reload();
      })
      .catch(err => console.log(err));
  }
}
