<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <title>AbleNet Calligraphy Trackpad & Pressure Controller</title>
  <style>
    :root {
      --bg-color: #f4f6f9;
      --card-bg: #ffffff;
      --primary: #10b981;
      --primary-hover: #059669;
      --accent: #f59e0b;
      --danger: #ef4444;
      --text: #1f2937;
      --border: #e5e7eb;
      --trackpad-bg: #f3f4f6;
    }

    * {
      box-sizing: border-box;
      touch-action: none;
      user-select: none;
    }

    body {
      margin: 0;
      padding: 20px;
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
      background-color: var(--bg-color);
      color: var(--text);
      display: flex;
      flex-direction: column;
      align-items: center;
      min-height: 100vh;
    }

    h1 {
      margin: 0 0 5px 0;
      font-size: 1.8rem;
      text-align: center;
    }

    p.subtitle {
      margin: 0 0 20px 0;
      color: #6b7280;
      font-size: 0.95rem;
      text-align: center;
    }

    .app-container {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      max-width: 1100px;
      width: 100%;
    }

    @media (max-width: 850px) {
      .app-container {
        grid-template-columns: 1fr;
      }
    }

    .panel {
      background: var(--card-bg);
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.08);
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .panel-title {
      font-weight: bold;
      font-size: 1.1rem;
      border-bottom: 2px solid var(--border);
      padding-bottom: 8px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    /* Device Layout */
    .device-grid {
      display: grid;
      grid-template-rows: auto auto auto;
      gap: 15px;
    }

    .pad-label {
      font-size: 0.85rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      color: #4b5563;
      margin-bottom: 5px;
    }

    .trackpad-zone {
      background-color: var(--trackpad-bg);
      border: 3px dashed #3b82f6;
      border-radius: 10px;
      height: 220px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: relative;
      cursor: crosshair;
      transition: border-color 0.2s, background-color 0.2s;
    }

    .trackpad-zone.active {
      background-color: #dbeafe;
      border-style: solid;
    }

    .accel-zone {
      background-color: #fef3c7;
      border: 3px solid var(--accent);
      border-radius: 10px;
      height: 110px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: relative;
      cursor: ns-resize;
    }

    .accel-zone.active {
      background-color: #fde68a;
    }

    .accel-gauge {
      width: 80%;
      height: 12px;
      background: #e5e7eb;
      border-radius: 6px;
      overflow: hidden;
      margin-top: 8px;
    }

    .accel-gauge-fill {
      height: 100%;
      width: 20%;
      background: var(--accent);
      transition: width 0.1s ease;
    }

    .button-group {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .btn-action {
      padding: 18px;
      font-size: 1rem;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      transition: transform 0.05s, background-color 0.2s;
      color: white;
    }

    .btn-action:active, .btn-action.pressed {
      transform: translateY(2px);
      box-shadow: 0 2px 3px rgba(0,0,0,0.15);
    }

    .btn-left {
      background-color: var(--primary);
    }
    .btn-left:hover { background-color: var(--primary-hover); }

    .btn-right {
      background-color: var(--danger);
    }
    .btn-right:hover { background-color: #dc2626; }

    /* Canvas Screen */
    #workspace {
      width: 100%;
      height: 380px;
      background: #ffffff;
      border: 2px solid var(--border);
      border-radius: 8px;
      position: relative;
      overflow: hidden;
    }

    canvas {
      width: 100%;
      height: 100%;
      display: block;
      background-color: #ffffff;
    }

    .stats {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 10px;
      font-size: 0.85rem;
      background: #f3f4f6;
      padding: 10px;
      border-radius: 6px;
    }

    .stat-item {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .stat-value {
      font-weight: bold;
      font-size: 1.1rem;
      color: #111827;
    }

    .controls-row {
      display: flex;
      gap: 10px;
      align-items: center;
      justify-content: space-between;
    }

    label {
      font-size: 0.9rem;
    }

    input[type="range"] {
      width: 100px;
    }
  </style>
</head>
<body>

  <h1>AbleNet Calligraphy Trackpad</h1>
  <p class="subtitle">Single Calligraphy Point • Variable Width Tracer • Switch Pressure Controls</p>

  <div class="app-container">
    
    <!-- LEFT PANEL: AbleNet Controls -->
    <div class="panel">
      <div class="panel-title">
        <span>Device Controls</span>
        <span style="font-size:0.8rem; font-weight:normal; color:#6b7280;">AbleNet Hardware</span>
      </div>

      <div class="device-grid">
        <!-- Main Movement Trackpad -->
        <div>
          <div class="pad-label">Primary Trackpad (Move Calligraphy Tip)</div>
          <div id="mainTrackpad" class="trackpad-zone">
            <span>Touch / Drag to draw ink line</span>
          </div>
        </div>

        <!-- Acceleration Trackpad -->
        <div>
          <div class="pad-label">Acceleration Pad (Boost Tip Movement Speed)</div>
          <div id="accelTrackpad" class="accel-zone">
            <span>Speed Control Zone</span>
            <div class="accel-gauge">
              <div id="accelFill" class="accel-gauge-fill"></div>
            </div>
          </div>
        </div>

        <!-- Switch Buttons for Pressure Control -->
        <div class="button-group">
          <button id="btnLeft" class="btn-action btn-left">Left Click (+ Pressure)</button>
          <button id="btnRight" class="btn-action btn-right">Right Click (- Pressure)</button>
        </div>
      </div>

      <!-- Sensitivity Controls -->
      <div class="controls-row">
        <label for="baseSpeed">Base Speed:</label>
        <input type="range" id="baseSpeed" min="0.5" max="3" step="0.1" value="1.5" />
        
        <label for="maxAccel">Max Accel Multiplier:</label>
        <input type="range" id="maxAccel" min="1" max="10" step="0.5" value="4" />
      </div>
    </div>

    <!-- RIGHT PANEL: Calligraphy Canvas -->
    <div class="panel">
      <div class="panel-title">
        <span>Calligraphy Canvas</span>
        <button id="btnClear" style="padding:4px 10px; font-size:0.8rem; cursor:pointer;">Clear Canvas</button>
      </div>

      <!-- Drawing Canvas -->
      <div id="workspace">
        <canvas id="simCanvas"></canvas>
      </div>

      <!-- Real-time Readouts -->
      <div class="stats">
        <div class="stat-item">
          <span>Brush Pressure / Width</span>
          <span id="statPressure" class="stat-value">8.0 px</span>
        </div>
        <div class="stat-item">
          <span>Speed Multiplier</span>
          <span id="statAccel" class="stat-value">1.0x</span>
        </div>
        <div class="stat-item">
          <span>Last Action</span>
          <span id="statAction" class="stat-value">Ready</span>
        </div>
      </div>
    </div>

  </div>

  <script>
    // --- Application State ---
    const state = {
      // Single Calligraphy Point Tip
      brush: { 
        x: 0, 
        y: 0, 
        prevX: 0, 
        prevY: 0, 
        width: 8,       // Current brush width/pressure
        minWidth: 2,    // Minimum pressure width
        maxWidth: 36,   // Maximum pressure width
        step: 3         // Pressure increment per switch click
      },
      baseSpeed: 1.5,
      accelMultiplier: 1.0,
      maxAccel: 4.0,
      lastAction: 'Ready',
      
      // Tracking
      trackpadActive: false,
      lastPadX: 0,
      lastPadY: 0,

      accelActive: false
    };

    // --- DOM Elements ---
    const mainTrackpad = document.getElementById('mainTrackpad');
    const accelTrackpad = document.getElementById('accelTrackpad');
    const accelFill = document.getElementById('accelFill');
    const btnLeft = document.getElementById('btnLeft');
    const btnRight = document.getElementById('btnRight');
    const btnClear = document.getElementById('btnClear');

    const baseSpeedInput = document.getElementById('baseSpeed');
    const maxAccelInput = document.getElementById('maxAccel');

    const statPressure = document.getElementById('statPressure');
    const statAccel = document.getElementById('statAccel');
    const statAction = document.getElementById('statAction');

    const canvas = document.getElementById('simCanvas');
    const ctx = canvas.getContext('2d');

    // Offscreen canvas to hold persistent drawn ink traces
    let inkCanvas, inkCtx;

    // --- Audio Feedback ---
    function playBeep(freq = 440, type = 'sine', duration = 0.08) {
      try {
        const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        const osc = audioCtx.createOscillator();
        const gain = audioCtx.createGain();
        osc.type = type;
        osc.frequency.value = freq;
        gain.gain.setValueAtTime(0.08, audioCtx.currentTime);
        gain.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + duration);
        osc.connect(gain);
        gain.connect(audioCtx.destination);
        osc.start();
        osc.stop(audioCtx.currentTime + duration);
      } catch (e) {}
    }

    // --- Canvas & Ink Setup ---
    function initCanvas() {
      const width = canvas.parentElement.clientWidth;
      const height = canvas.parentElement.clientHeight;

      canvas.width = width;
      canvas.height = height;

      // Initialize persistent ink canvas layer
      if (!inkCanvas) {
        inkCanvas = document.createElement('canvas');
      }
      
      // Preserve drawing on resize if possible
      const tempCanvas = document.createElement('canvas');
      tempCanvas.width = inkCanvas.width || width;
      tempCanvas.height = inkCanvas.height || height;
      const tempCtx = tempCanvas.getContext('2d');
      if (inkCanvas.width > 0) tempCtx.drawImage(inkCanvas, 0, 0);

      inkCanvas.width = width;
      inkCanvas.height = height;
      inkCtx = inkCanvas.getContext('2d');

      // Fill background white on ink layer
      inkCtx.fillStyle = '#ffffff';
      inkCtx.fillRect(0, 0, width, height);
      if (tempCanvas.width > 0) inkCtx.drawImage(tempCanvas, 0, 0);

      // Center single brush point
      if (state.brush.x === 0 && state.brush.y === 0) {
        state.brush.x = width / 2;
        state.brush.y = height / 2;
        state.brush.prevX = state.brush.x;
        state.brush.prevY = state.brush.y;
      }

      redraw();
    }

    function clearInkCanvas() {
      inkCtx.fillStyle = '#ffffff';
      inkCtx.fillRect(0, 0, inkCanvas.width, inkCanvas.height);
      state.lastAction = 'Cleared Canvas';
      updateUI();
      redraw();
    }

    // --- Variable Width Calligraphy Tracer ---
    function moveBrushPoint(dx, dy) {
      state.brush.prevX = state.brush.x;
      state.brush.prevY = state.brush.y;

      const finalSpeed = state.baseSpeed * state.accelMultiplier;
      state.brush.x += dx * finalSpeed;
      state.brush.y += dy * finalSpeed;

      // Clamp within canvas frame
      state.brush.x = Math.max(state.brush.width / 2, Math.min(canvas.width - state.brush.width / 2, state.brush.x));
      state.brush.y = Math.max(state.brush.width / 2, Math.min(canvas.height - state.brush.width / 2, state.brush.y));

      // Draw variable-width line tracer on persistent ink canvas
      if (state.brush.x !== state.brush.prevX || state.brush.y !== state.brush.prevY) {
        inkCtx.beginPath();
        inkCtx.moveTo(state.brush.prevX, state.brush.prevY);
        inkCtx.lineTo(state.brush.x, state.brush.y);
        inkCtx.strokeStyle = '#000000'; // Black foreground ink
        inkCtx.lineWidth = state.brush.width;
        inkCtx.lineCap = 'round';
        inkCtx.lineJoin = 'round';
        inkCtx.stroke();
      }

      redraw();
    }

    // --- Main Trackpad Motion ---
    function handleTrackpadStart(e) {
      state.trackpadActive = true;
      mainTrackpad.classList.add('active');
      const point = e.touches ? e.touches[0] : e;
      state.lastPadX = point.clientX;
      state.lastPadY = point.clientY;
    }

    function handleTrackpadMove(e) {
      if (!state.trackpadActive) return;
      e.preventDefault();
      const point = e.touches ? e.touches[0] : e;
      const dx = point.clientX - state.lastPadX;
      const dy = point.clientY - state.lastPadY;

      state.lastPadX = point.clientX;
      state.lastPadY = point.clientY;

      moveBrushPoint(dx, dy);
    }

    function handleTrackpadEnd() {
      state.trackpadActive = false;
      mainTrackpad.classList.remove('active');
    }

    mainTrackpad.addEventListener('pointerdown', handleTrackpadStart);
    window.addEventListener('pointermove', handleTrackpadMove);
    window.addEventListener('pointerup', handleTrackpadEnd);

    // --- Acceleration Pad Controls ---
    function handleAccelStart(e) {
      state.accelActive = true;
      accelTrackpad.classList.add('active');
      updateAccel(e);
    }

    function handleAccelMove(e) {
      if (!state.accelActive) return;
      e.preventDefault();
      updateAccel(e);
    }

    function handleAccelEnd() {
      state.accelActive = false;
      accelTrackpad.classList.remove('active');
      state.accelMultiplier = 1.0;
      updateUI();
    }

    function updateAccel(e) {
      const rect = accelTrackpad.getBoundingClientRect();
      const point = e.touches ? e.touches[0] : e;
      let normY = 1 - ((point.clientY - rect.top) / rect.height);
      normY = Math.max(0, Math.min(1, normY));

      state.accelMultiplier = 1.0 + normY * (state.maxAccel - 1.0);
      updateUI();
    }

    accelTrackpad.addEventListener('pointerdown', handleAccelStart);
    window.addEventListener('pointermove', handleAccelMove);
    window.addEventListener('pointerup', handleAccelEnd);

    // --- Switch Pressure Adjustment ---
    // Left Click -> Increases pressure/width
    function increasePressure() {
      state.brush.width = Math.min(state.brush.maxWidth, state.brush.width + state.brush.step);
      state.lastAction = '+ Pressure';
      playBeep(650, 'sine', 0.06);
      updateUI();
      redraw();
    }

    // Right Click -> Decreases pressure/width
    function decreasePressure() {
      state.brush.width = Math.max(state.brush.minWidth, state.brush.width - state.brush.step);
      state.lastAction = '- Pressure';
      playBeep(450, 'sine', 0.06);
      updateUI();
      redraw();
    }

    btnLeft.addEventListener('click', increasePressure);
    btnRight.addEventListener('click', decreasePressure);

    // Input slider events
    baseSpeedInput.addEventListener('input', (e) => {
      state.baseSpeed = parseFloat(e.target.value);
    });

    maxAccelInput.addEventListener('input', (e) => {
      state.maxAccel = parseFloat(e.target.value);
    });

    btnClear.addEventListener('click', clearInkCanvas);

    // --- UI Update ---
    function updateUI() {
      statPressure.textContent = `${state.brush.width.toFixed(1)} px`;
      statAccel.textContent = `${state.accelMultiplier.toFixed(1)}x`;
      statAction.textContent = state.lastAction;

      const fillPct = ((state.accelMultiplier - 1.0) / (state.maxAccel - 1.0)) * 100;
      accelFill.style.width = `${Math.max(10, fillPct)}%`;
    }

    // --- Render Loop ---
    function redraw() {
      // 1. Draw persistent black ink layer
      ctx.drawImage(inkCanvas, 0, 0);

      // 2. Draw single Calligraphy Tip cursor indicator
      const r = state.brush.width / 2;
      ctx.beginPath();
      ctx.arc(state.brush.x, state.brush.y, Math.max(r, 2), 0, Math.PI * 2);
      ctx.fillStyle = 'rgba(239, 68, 68, 0.7)'; // Translucent red tip pointer
      ctx.fill();
      ctx.strokeStyle = '#000000';
      ctx.lineWidth = 1.5;
      ctx.stroke();

      // Draw tip speed indicator halo when accelerated
      if (state.accelMultiplier > 1.1) {
        ctx.beginPath();
        ctx.arc(state.brush.x, state.brush.y, r + 4 * (state.accelMultiplier / 2), 0, Math.PI * 2);
        ctx.strokeStyle = 'rgba(245, 158, 11, 0.8)';
        ctx.lineWidth = 2;
        ctx.stroke();
      }
    }

    // Init Application
    window.addEventListener('resize', initCanvas);
    initCanvas();
  </script>
</body>
</html>
