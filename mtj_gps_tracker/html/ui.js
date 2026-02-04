// Helper to play audio
function playAudio(id) {
  const audio = document.getElementById(id);
  if (audio) {
    audio.currentTime = 0;
    audio.play().catch(() => {}); // In modernen Browsern Fehler abfangen
  }
}

// Main UI
function showMainUI({title, message, style, sec}) {
  const ui = document.getElementById('main-ui');
  if (!ui) return;
  ui.innerHTML = `<h2>${title || ''}</h2><p>${message || ''}</p>`;
  ui.className = style || '';
  ui.classList.remove('hidden');
  if(style === 'success') playAudio('audio-success');
  if(style === 'error') playAudio('audio-error');
  // Anzeige immer mindestens 5 Sekunden sichtbar!
  let minSec = Math.max(sec || 0, 5);
  setTimeout(hideMainUI, minSec * 1000);
}
function hideMainUI() {
  const ui = document.getElementById('main-ui');
  if (ui) ui.classList.add('hidden');
}

// Progress UI
let progressTimeout = null;
function showProgressUI({title, message, duration}) {
  const ui = document.getElementById('progress-ui');
  if (!ui) return;
  const bar = ui.querySelector('.progress-bar .progress');
  if (bar) bar.style.width = '0%';
  const textBox = ui.querySelector('.progress-text');
  if (textBox) textBox.innerHTML = `<b>${title || ''}</b><br>${message || ''}`;
  ui.classList.remove('hidden');
  let elapsed = 0;
  const total = duration || 7000;
  if(progressTimeout) clearInterval(progressTimeout);
  progressTimeout = setInterval(()=>{
      elapsed += 50;
      let perc = Math.min(100, (elapsed/total)*100);
      if (bar) bar.style.width = perc+"%";
      if(elapsed >= total) { 
        hideProgressUI(); 
        clearInterval(progressTimeout);
      }
  },50);
}
function hideProgressUI() {
  const ui = document.getElementById('progress-ui');
  if (ui) ui.classList.add('hidden');
  if(progressTimeout) clearInterval(progressTimeout);
}

// GPS Timer UI
function showGpsTimerUI({time, color}) {
  const ui = document.getElementById('gps-timer-ui');
  const timeElem = document.getElementById('gps-timer-time');
  if (!ui || !timeElem) return;
  timeElem.textContent = time || "00:00";
  ui.className = color || 'red';
  ui.classList.remove('hidden');
}
function updateGpsTimerUI({time, color}) {
  showGpsTimerUI({time, color});
}
function hideGpsTimerUI() {
  const ui = document.getElementById('gps-timer-ui');
  if (ui) ui.classList.add('hidden');
}

// NUI Message Handler
window.addEventListener('message', (event) => {
  const {action, ...args} = event.data || {};
  if(action === "showMain") showMainUI(args);
  if(action === "hideMain") hideMainUI();
  if(action === "showProgress") showProgressUI(args);
  if(action === "hideProgress") hideProgressUI();
  if(action === "showTimer") showGpsTimerUI(args);
  if(action === "updateTimer") updateGpsTimerUI(args);
  if(action === "hideTimer") hideGpsTimerUI();
  // Repariert: showInfo mapped auf showMainUI, damit Info/RP-Texte wieder gehen!
  if(action === "showInfo") {
    showMainUI({
      title: args.title || "",
      message: args.text || "",
      style: args.color === "red" ? "error" : (args.color === "success" ? "success" : ""),
      sec: Math.max(args.sec || 0, 5) // Mindestens 5 Sekunden anzeigen!
    });
  }
});