document.querySelector("#logInForm").addEventListener("submit", (e) => {
  e.preventDefault();

  const email = document.querySelector("#email").value;

  const formData = new FormData();
  formData.append("email", email);

  fetch("./formSubmits/userLogin.php", {
    method: "POST",
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      document.querySelector("#logIn").style.display = "none";
      document.querySelector("#nominees").classList.remove("d-none");
      $divCategories = document.querySelector("#categories");

      const groupedData = data.groupedData;
      groupedData.forEach((category) => {
        const nominees = Array.isArray(category.nominees)
          ? category.nominees
          : [];
        $divCategories.innerHTML += `
          <div class="category-container">
            <h3 class="category-name">${
              category.category_name
            }</h3> <!-- Category Name -->

            <div class="nominees-list">
              ${nominees
                .map((nominee) => {
                  const nomineeId = `nominee-${nominee.user_id}`;
                  return `
                  <div class="d-flex align-items-center nominee-item" id="div-${nomineeId}">
                    <span class="fs-5 me-2 align-self-center">${nominee.first_name} ${nominee.last_name}</span>
                    <input type="checkbox" name="votes[]" value="${nominee.user_id}" class="vote-checkbox" id="${nomineeId}" />
                    <textarea name="voter_comments[]" placeholder="Leave a comment..." class="form-control mt-2" id="comment-${nomineeId} required"></textarea>
                  </div>
                `;
                })
                .join("")}
            </div>
          </div>
        `;
      });
    });
});

document.querySelector("#submitVotesForm").addEventListener("submit", (e) => {
  e.preventDefault();

  const votes = [];
  const comments = [];

  document
    .querySelectorAll('input[type="checkbox"]:checked')
    .forEach((checkbox) => {
      votes.push(checkbox.value);
    });

  document
    .querySelectorAll('textarea[name="voter_comments[]"]')
    .forEach((textarea) => {
      comments.push(textarea.value);
    });

  const formData = new FormData();
  formData.append("votes", JSON.stringify(votes));
  formData.append("voter_comments", JSON.stringify(comments));

  fetch("/formSubmits/voterForm.php", {
    method: "POST",
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.success) {
        alert("Votes and comments submitted successfully!");
      } else {
        alert("Error: " + data.message);
      }
    });
});
