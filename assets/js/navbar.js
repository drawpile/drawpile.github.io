document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("navbar-toggle").onclick = function() {
    this.classList.toggle("is-active");
    document.getElementById("navbar-menu").classList.toggle("is-active");
  };

  function decodeUsernameFromCookie(username) {
    // If there's a comma or something in the username, it gets quotes and
    // escaped with octal. So 'secret,' gets turned into '"secret\054"'.
    const m = /^"(.+)"$/.exec(username);
    if (m) {
      username = m[1].replaceAll(/\\([0-9]{3})/g, function (_, ord) {
        return String.fromCharCode(parseInt(ord, 8));
      });
    }
    // If there's other characters in the username, they get surrounded by
    // dashes with the ordinal in decimal between them.
    return username.replaceAll(/-([0-9]+)-/g, function (_, ord) {
      return String.fromCharCode(parseInt(ord, 10));
    });
  }

  function getUsernameFromCookies() {
    for (const cookie of document.cookie.split(";")) {
      const [key, value] = cookie.split("=");
      if (key.trim() === "username") {
        return decodeUsernameFromCookie(value.trim());
      }
    }
    return null;
  }

  const username = getUsernameFromCookies();
  const accountElement = document.getElementById("navbar-account");
  if(username) {
    accountElement.classList.add("has-dropdown", "is-hoverable");

    const aAccount = document.createElement("a");
    aAccount.classList.add("navbar-link");

    const spanIcon = document.createElement("span");
    spanIcon.classList.add("icon");
    aAccount.appendChild(spanIcon);

    const iIcon = document.createElement("i");
    iIcon.classList.add("fa", "fa-user-circle");
    spanIcon.appendChild(iIcon);

    aAccount.appendChild(document.createTextNode(username));

    const divDropdown = document.createElement("div");
    divDropdown.classList.add("navbar-dropdown");

    const links = [
      {href: "https://drawpile.net/accounts/profile", text: "Profile"},
      {href: "https://drawpile.net/accounts/logout", text: "Log out"},
    ];
    for (const link of links) {
      const aDropdown = document.createElement("a");
      aDropdown.classList.add("navbar-item");
      aDropdown.href = link.href;
      aDropdown.textContent = link.text;
      divDropdown.appendChild(aDropdown);
    }

    accountElement.replaceChildren(aAccount, divDropdown);
  } else {
    const aLogin = document.createElement("a");
    aLogin.classList.add("button");
    aLogin.href = "https://drawpile.net/accounts/login/";
    aLogin.textContent = "Log in";
    accountElement.replaceChildren(aLogin);
  }
});
