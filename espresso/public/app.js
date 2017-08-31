let ws = new WebSocket(`ws://${location.host}`);
let pingsContainer = document.querySelector(".pings-table-body");
ws.onmessage = msg => {
  let data = JSON.parse(msg.data);
  row = document.createElement("tr");
  message = document.createElement("td")
  message.textContent = data.msg;

  timestamp = document.createElement("td")
  timestamp.textContent = data.ts;

  row.appendChild(message)
  row.appendChild(timestamp);
  pingsContainer.appendChild(row);
};
