<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Game Station</title>
  <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet" />
  <style>
    :root {
      --bg: #0a0a0f;
      --surface: #111118;
      --window-bg: #16161e;
      --titlebar: #1c1c26;
      --titlebar-border: #2a2a38;
      --card-bg: #1e1e2a;
      --card-hover: #252536;
      --accent: #6c63ff;
      --accent2: #a78bfa;
      --accent3: #f472b6;
      --text: #e8e8f0;
      --text-muted: #888899;
      --text-dim: #555566;
      --close: #ff5f57;
      --minimize: #febc2e;
      --maximize: #28c840;
      --gap: 20px;
      --radius: 16px;
      --window-radius: 14px;
    }

    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      background: var(--bg);
      font-family: 'Inter', -apple-system, sans-serif;
      color: var(--text);
      height: 100vh;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* Desktop background */
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background:
        radial-gradient(ellipse 80% 60% at 20% 20%, rgba(108,99,255,0.12) 0%, transparent 60%),
        radial-gradient(ellipse 60% 80% at 80% 80%, rgba(244,114,182,0.08) 0%, transparent 60%),
        radial-gradient(ellipse 50% 50% at 50% 50%, rgba(167,139,250,0.04) 0%, transparent 70%);
      pointer-events: none;
      z-index: 0;
    }

    /* Outer container — the "gap" around the window */
    .desktop {
      position: relative;
      z-index: 1;
      width: calc(100vw - 40px);
      height: calc(100vh - 40px);
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* The macOS-like window */
    .mac-window {
      width: 100%;
      height: 100%;
      background: var(--window-bg);
      border-radius: var(--window-radius);
      box-shadow:
        0 0 0 1px rgba(255,255,255,0.06),
        0 32px 80px rgba(0,0,0,0.8),
        0 8px 24px rgba(0,0,0,0.6);
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    /* Title bar */
    .titlebar {
      background: var(--titlebar);
      border-bottom: 1px solid var(--titlebar-border);
      padding: 0 20px;
      height: 50px;
      display: flex;
      align-items: center;
      gap: 16px;
      flex-shrink: 0;
      user-select: none;
    }

    .traffic-lights {
      display: flex;
      gap: 8px;
      align-items: center;
    }

    .dot {
      width: 13px;
      height: 13px;
      border-radius: 50%;
      cursor: default;
      transition: filter 0.15s;
    }
    .dot:hover { filter: brightness(1.3); }
    .dot.close  { background: var(--close); box-shadow: 0 0 6px rgba(255,95,87,0.5); }
    .dot.min    { background: var(--minimize); box-shadow: 0 0 6px rgba(254,188,46,0.4); }
    .dot.max    { background: var(--maximize); box-shadow: 0 0 6px rgba(40,200,64,0.4); }

    .titlebar-title {
      flex: 1;
      text-align: center;
      font-size: 13px;
      font-weight: 600;
      color: var(--text-muted);
      letter-spacing: 0.3px;
      margin-right: 60px; /* balance the traffic lights */
    }

    .titlebar-title span {
      background: linear-gradient(90deg, var(--accent2), var(--accent3));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    /* Main layout */
    .content {
      display: flex;
      flex: 1;
      overflow: hidden;
    }

    /* Sidebar */
    .sidebar {
      width: 220px;
      background: rgba(10,10,18,0.6);
      border-right: 1px solid var(--titlebar-border);
      display: flex;
      flex-direction: column;
      flex-shrink: 0;
      overflow-y: auto;
    }

    .sidebar::-webkit-scrollbar { width: 4px; }
    .sidebar::-webkit-scrollbar-track { background: transparent; }
    .sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.08); border-radius: 2px; }

    .sidebar-header {
      padding: 20px 16px 12px;
      font-size: 10px;
      text-transform: uppercase;
      letter-spacing: 1.5px;
      color: var(--text-dim);
      font-weight: 600;
    }

    .category-btn {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 9px 16px;
      font-size: 13px;
      color: var(--text-muted);
      cursor: pointer;
      border-radius: 8px;
      margin: 1px 8px;
      transition: all 0.15s;
      font-weight: 500;
    }
    .category-btn:hover { background: rgba(255,255,255,0.05); color: var(--text); }
    .category-btn.active { background: rgba(108,99,255,0.18); color: var(--accent2); }

    .category-icon { font-size: 15px; width: 20px; text-align: center; }

    .sidebar-count {
      margin-left: auto;
      font-size: 11px;
      background: rgba(255,255,255,0.07);
      padding: 2px 7px;
      border-radius: 20px;
      color: var(--text-dim);
    }

    /* Right panel */
    .main-panel {
      flex: 1;
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }

    /* Search bar */
    .search-bar {
      padding: 14px 20px;
      border-bottom: 1px solid var(--titlebar-border);
      display: flex;
      gap: 12px;
      align-items: center;
    }

    .search-input-wrap {
      flex: 1;
      position: relative;
    }
    .search-input-wrap::before {
      content: '⌕';
      position: absolute;
      left: 12px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--text-dim);
      font-size: 17px;
    }
    .search-input {
      width: 100%;
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 10px;
      padding: 9px 14px 9px 36px;
      font-size: 13px;
      color: var(--text);
      outline: none;
      font-family: inherit;
      transition: border-color 0.2s, background 0.2s;
    }
    .search-input:focus {
      border-color: rgba(108,99,255,0.5);
      background: rgba(255,255,255,0.07);
    }
    .search-input::placeholder { color: var(--text-dim); }

    .game-count-badge {
      font-size: 12px;
      color: var(--text-dim);
      white-space: nowrap;
    }

    /* Game grid */
    .game-grid-wrap {
      flex: 1;
      overflow-y: auto;
      padding: 16px 20px 20px;
    }
    .game-grid-wrap::-webkit-scrollbar { width: 6px; }
    .game-grid-wrap::-webkit-scrollbar-track { background: transparent; }
    .game-grid-wrap::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.08); border-radius: 3px; }

    .game-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
      gap: 14px;
    }

    .game-card {
      background: var(--card-bg);
      border-radius: 12px;
      border: 1px solid rgba(255,255,255,0.05);
      cursor: pointer;
      transition: all 0.2s cubic-bezier(0.34, 1.56, 0.64, 1);
      overflow: hidden;
      position: relative;
    }
    .game-card:hover {
      transform: translateY(-3px) scale(1.01);
      background: var(--card-hover);
      border-color: rgba(108,99,255,0.3);
      box-shadow: 0 12px 30px rgba(0,0,0,0.4), 0 0 0 1px rgba(108,99,255,0.2);
    }

    .game-thumb {
      width: 100%;
      aspect-ratio: 4/3;
      background: linear-gradient(135deg, #1a1a28 0%, #252538 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 36px;
      position: relative;
      overflow: hidden;
    }

    .game-thumb::after {
      content: '';
      position: absolute;
      inset: 0;
      background: linear-gradient(to bottom, transparent 60%, rgba(0,0,0,0.5));
    }

    .game-info {
      padding: 10px 12px 12px;
    }
    .game-name {
      font-size: 12px;
      font-weight: 600;
      color: var(--text);
      line-height: 1.3;
      margin-bottom: 4px;
    }
    .game-tag {
      font-size: 10px;
      color: var(--text-dim);
      background: rgba(255,255,255,0.05);
      padding: 2px 7px;
      border-radius: 20px;
      display: inline-block;
      font-weight: 500;
    }

    .play-overlay {
      position: absolute;
      inset: 0;
      background: rgba(108,99,255,0.85);
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      transition: opacity 0.2s;
      font-size: 32px;
      z-index: 2;
    }
    .game-card:hover .play-overlay { opacity: 1; }

    /* Game viewer modal */
    .game-modal {
      position: fixed;
      inset: 0;
      z-index: 100;
      display: none;
      align-items: center;
      justify-content: center;
      background: rgba(0,0,0,0.7);
      backdrop-filter: blur(10px);
    }
    .game-modal.open { display: flex; }

    .game-window {
      width: calc(100vw - 80px);
      height: calc(100vh - 80px);
      background: var(--window-bg);
      border-radius: var(--window-radius);
      box-shadow:
        0 0 0 1px rgba(255,255,255,0.07),
        0 40px 100px rgba(0,0,0,0.9);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      animation: popIn 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
    }

    @keyframes popIn {
      from { transform: scale(0.9); opacity: 0; }
      to   { transform: scale(1);   opacity: 1; }
    }

    .game-titlebar {
      background: var(--titlebar);
      border-bottom: 1px solid var(--titlebar-border);
      padding: 0 20px;
      height: 48px;
      display: flex;
      align-items: center;
      gap: 16px;
      flex-shrink: 0;
    }

    .game-titlebar .titlebar-title {
      margin-right: 0;
    }

    .back-btn {
      background: rgba(255,255,255,0.06);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 8px;
      padding: 5px 14px;
      font-size: 12px;
      color: var(--text-muted);
      cursor: pointer;
      font-family: inherit;
      font-weight: 500;
      transition: all 0.15s;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .back-btn:hover { background: rgba(255,255,255,0.1); color: var(--text); }

    .open-btn {
      background: rgba(108,99,255,0.2);
      border: 1px solid rgba(108,99,255,0.3);
      border-radius: 8px;
      padding: 5px 14px;
      font-size: 12px;
      color: var(--accent2);
      cursor: pointer;
      font-family: inherit;
      font-weight: 500;
      transition: all 0.15s;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 6px;
    }
    .open-btn:hover { background: rgba(108,99,255,0.35); }

    .game-frame-wrap {
      flex: 1;
      position: relative;
      background: #000;
    }

    .game-iframe {
      width: 100%;
      height: 100%;
      border: none;
      display: block;
    }

    .iframe-blocked {
      display: none;
      position: absolute;
      inset: 0;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      gap: 20px;
      color: var(--text-muted);
      text-align: center;
    }
    .iframe-blocked.show { display: flex; }
    .iframe-blocked h2 { font-size: 20px; color: var(--text); }
    .iframe-blocked p { font-size: 14px; max-width: 340px; line-height: 1.6; }
    .launch-link {
      background: linear-gradient(135deg, var(--accent), var(--accent2));
      color: white;
      padding: 12px 28px;
      border-radius: 10px;
      font-size: 14px;
      font-weight: 600;
      text-decoration: none;
      transition: opacity 0.2s;
    }
    .launch-link:hover { opacity: 0.85; }

    /* Empty state */
    .empty {
      grid-column: 1 / -1;
      padding: 60px 20px;
      text-align: center;
      color: var(--text-dim);
    }

    /* Scrollbar */
    .game-grid-wrap::-webkit-scrollbar { width: 5px; }
  </style>
</head>
<body>

<div class="desktop">
  <div class="mac-window">

    <!-- Title bar -->
    <div class="titlebar">
      <div class="traffic-lights">
        <div class="dot close"></div>
        <div class="dot min"></div>
        <div class="dot max"></div>
      </div>
      <div class="titlebar-title"><span>🪐 Game Station</span></div>
    </div>

    <!-- Body -->
    <div class="content">

      <!-- Sidebar -->
      <div class="sidebar">
        <div class="sidebar-header">Library</div>
        <div class="category-btn active" onclick="filterCategory('all', this)">
          <span class="category-icon">🎮</span> All Games
          <span class="sidebar-count" id="count-all">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('action', this)">
          <span class="category-icon">⚔️</span> Action
          <span class="sidebar-count" id="count-action">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('racing', this)">
          <span class="category-icon">🏎️</span> Racing
          <span class="sidebar-count" id="count-racing">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('puzzle', this)">
          <span class="category-icon">🧩</span> Puzzle
          <span class="sidebar-count" id="count-puzzle">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('sports', this)">
          <span class="category-icon">⚽</span> Sports
          <span class="sidebar-count" id="count-sports">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('idle', this)">
          <span class="category-icon">💰</span> Idle / Clicker
          <span class="sidebar-count" id="count-idle">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('simulation', this)">
          <span class="category-icon">🌍</span> Simulation
          <span class="sidebar-count" id="count-simulation">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('stickman', this)">
          <span class="category-icon">🦴</span> Stickman
          <span class="sidebar-count" id="count-stickman">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('shooter', this)">
          <span class="category-icon">🔫</span> Shooter
          <span class="sidebar-count" id="count-shooter">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('io', this)">
          <span class="category-icon">🌐</span> .io Games
          <span class="sidebar-count" id="count-io">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('platformer', this)">
          <span class="category-icon">🏃</span> Platformer
          <span class="sidebar-count" id="count-platformer">0</span>
        </div>
        <div class="category-btn" onclick="filterCategory('other', this)">
          <span class="category-icon">✨</span> Other
          <span class="sidebar-count" id="count-other">0</span>
        </div>
      </div>

      <!-- Main panel -->
      <div class="main-panel">
        <div class="search-bar">
          <div class="search-input-wrap">
            <input class="search-input" type="text" placeholder="Search games…" id="searchInput" oninput="handleSearch()" />
          </div>
          <div class="game-count-badge" id="visibleCount">0 games</div>
        </div>
        <div class="game-grid-wrap">
          <div class="game-grid" id="gameGrid"></div>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- Game modal -->
<div class="game-modal" id="gameModal">
  <div class="game-window">
    <div class="game-titlebar">
      <div class="traffic-lights">
        <div class="dot close" onclick="closeGame()"></div>
        <div class="dot min"></div>
        <div class="dot max"></div>
      </div>
      <div class="titlebar-title" id="modalTitle">Game</div>
      <button class="back-btn" onclick="closeGame()">← Back</button>
      <a class="open-btn" id="openExternal" href="#" target="_blank">↗ Open Full Site</a>
    </div>
    <div class="game-frame-wrap">
      <iframe class="game-iframe" id="gameIframe" allowfullscreen allow="fullscreen; autoplay"></iframe>
      <div class="iframe-blocked" id="iframeBlocked">
        <div style="font-size:48px">🎮</div>
        <h2 id="blockedTitle">Ready to Play!</h2>
        <p>This game opens best in a new tab. Click the button below to play on GameSaturn.</p>
        <a class="launch-link" id="blockedLink" href="#" target="_blank">Play Now on GameSaturn ↗</a>
      </div>
    </div>
  </div>
</div>

<script>
const GAMES = [
  // Action
  { name: "Moto X3M", slug: "moto-x3m", cat: "racing", icon: "🏍️" },
  { name: "Puppet Master", slug: "puppet-master", cat: "action", icon: "🤖" },
  { name: "Rio Rex", slug: "rio-rex", cat: "action", icon: "🦖" },
  { name: "Time Shooter 2", slug: "time-shooter-2", cat: "shooter", icon: "🔫" },
  { name: "Time Shooter 3", slug: "time-shooter-3", cat: "shooter", icon: "🔫" },
  { name: "Rooftop Snipers 2", slug: "rooftop-snipers-2", cat: "shooter", icon: "🎯" },
  { name: "Murder", slug: "murder", cat: "action", icon: "🗡️" },
  { name: "Moto X3M Winter", slug: "moto-x3m-winter", cat: "racing", icon: "❄️" },
  { name: "Wrestle Bros", slug: "wrestle-bros", cat: "action", icon: "🥊" },
  { name: "Dragon Ball Z Devolution", slug: "dragon-ball-z-devolution", cat: "action", icon: "⚡" },
  { name: "Bullet Force", slug: "bullet-force", cat: "shooter", icon: "💥" },
  { name: "SuperHot", slug: "superhot", cat: "shooter", icon: "🔥" },
  { name: "Funny Shooter 2", slug: "funny-shooter-2", cat: "shooter", icon: "🤣" },
  { name: "Combat Online", slug: "combat-online", cat: "shooter", icon: "🎖️" },
  { name: "Pixel Shooter", slug: "pixel-shooter", cat: "shooter", icon: "👾" },
  { name: "Paint Strike", slug: "paint-strike", cat: "shooter", icon: "🎨" },
  { name: "Sniper Shot: Bullet Time", slug: "sniper-shot-bullet-time", cat: "shooter", icon: "🎯" },
  { name: "Last Warriors", slug: "last-warriors", cat: "action", icon: "⚔️" },
  { name: "Ragdoll Hit", slug: "ragdoll-hit", cat: "action", icon: "💢" },
  { name: "Gladihoppers", slug: "gladihoppers", cat: "action", icon: "🛡️" },
  { name: "Stickman Dragon Fight", slug: "stickman-dragon-fight", cat: "stickman", icon: "🐉" },
  { name: "Sausage Flip", slug: "sausage-flip", cat: "action", icon: "🌭" },
  { name: "Amazing Strange Rope Police", slug: "amazing-strange-rope-police", cat: "action", icon: "🦸" },
  { name: "Fox Simulator 3D", slug: "fox-simulator-3d", cat: "simulation", icon: "🦊" },
  { name: "Burnin' Rubber 5 XS", slug: "burnin-rubber-5-xs", cat: "racing", icon: "🔥" },
  { name: "Stealing the Diamond", slug: "stealing-the-diamond", cat: "action", icon: "💎" },
  { name: "Fleeing the Complex", slug: "fleeing-the-complex", cat: "action", icon: "🏃" },
  { name: "Dreadhead Parkour", slug: "dreadhead-parkour", cat: "platformer", icon: "🏃" },
  { name: "House of Hazards", slug: "house-of-hazards", cat: "action", icon: "🏠" },
  { name: "Breaking the Bank", slug: "breaking-the-bank", cat: "action", icon: "🏦" },
  { name: "Idle Ants", slug: "idle-ants", cat: "idle", icon: "🐜" },
  // Racing
  { name: "Moto X3M 6 Spooky Land", slug: "moto-x3m-6-spooky-land", cat: "racing", icon: "👻" },
  { name: "Burnout Drift 3: Seaport Max", slug: "burnout-drift-3-seaport-max", cat: "racing", icon: "🚗" },
  { name: "Burnout Drift: Hilltop", slug: "burnout-drift-hilltop", cat: "racing", icon: "⛰️" },
  { name: "Drift Hunters", slug: "drift-hunters", cat: "racing", icon: "🚗" },
  { name: "Drift Hunters Pro", slug: "drift-hunters-pro", cat: "racing", icon: "🏁" },
  { name: "Madalin Stunt Cars 2", slug: "madalin-stunt-cars-2", cat: "racing", icon: "🤸" },
  { name: "Demolition Derby Crash Racing", slug: "demolition-derby-crash-racing", cat: "racing", icon: "💥" },
  { name: "Snow Rider 3D", slug: "snow-rider-3d", cat: "racing", icon: "⛷️" },
  { name: "Highway Racer 2", slug: "highway-racer-2", cat: "racing", icon: "🛣️" },
  { name: "MR RACER - Car Racing", slug: "mr-racer-car-racing", cat: "racing", icon: "🏎️" },
  { name: "Crazy Bikes", slug: "crazy-bikes", cat: "racing", icon: "🏍️" },
  { name: "Crazy Cars", slug: "crazy-cars", cat: "racing", icon: "🚙" },
  { name: "Traffic Jam 3D", slug: "traffic-jam-3d", cat: "racing", icon: "🚦" },
  { name: "Drive Mad", slug: "drive-mad", cat: "racing", icon: "😡" },
  { name: "Stock Car Hero", slug: "stock-car-hero", cat: "racing", icon: "🏁" },
  { name: "3D Moto Simulator 2", slug: "3d-moto-simulator-2", cat: "racing", icon: "🏍️" },
  { name: "Real City Driving 2", slug: "real-city-driving-2", cat: "racing", icon: "🏙️" },
  { name: "Tiny Town Racing", slug: "tiny-town-racing", cat: "racing", icon: "🏘️" },
  { name: "Grand Prix Hero", slug: "grand-prix-hero", cat: "racing", icon: "🏆" },
  { name: "Super Star Car", slug: "super-star-car", cat: "racing", icon: "⭐" },
  { name: "Super Tunnel Rush", slug: "super-tunnel-rush", cat: "racing", icon: "🚇" },
  { name: "Tunnel Rush", slug: "tunnel-rush", cat: "racing", icon: "🌀" },
  { name: "War of Caribbean Pirates", slug: "war-of-caribbean-pirates", cat: "action", icon: "🏴‍☠️" },
  // Puzzle
  { name: "Brain Test 2: Tricky Stories", slug: "brain-test-2-tricky-stories", cat: "puzzle", icon: "🧠" },
  { name: "Detective Loupe Puzzle", slug: "detective-loupe-puzzle", cat: "puzzle", icon: "🔍" },
  { name: "Blocky Blast Puzzle", slug: "blocky-blast-puzzle", cat: "puzzle", icon: "🟦" },
  { name: "Roller", slug: "roller", cat: "puzzle", icon: "🎯" },
  { name: "Gomu Goman", slug: "gomu-goman", cat: "puzzle", icon: "🧶" },
  { name: "CircloO 2", slug: "circloo-2", cat: "puzzle", icon: "⭕" },
  { name: "Stickman Bridge Constructor", slug: "stickman-bridge-constructor", cat: "puzzle", icon: "🌉" },
  { name: "Rescue the Fish", slug: "rescue-the-fish", cat: "puzzle", icon: "🐟" },
  { name: "Maze: Path Of Light", slug: "maze-path-of-light", cat: "puzzle", icon: "🌟" },
  { name: "Draw Climber", slug: "draw-climber", cat: "puzzle", icon: "✏️" },
  { name: "Plonky", slug: "plonky", cat: "puzzle", icon: "⚙️" },
  { name: "Who Is?", slug: "who-is", cat: "puzzle", icon: "❓" },
  { name: "Diggy", slug: "diggy", cat: "puzzle", icon: "⛏️" },
  { name: "Funny Eye Surgery", slug: "funny-eye-surgery", cat: "puzzle", icon: "👁️" },
  // Sports
  { name: "Penalty Shooters 2", slug: "penalty-shooters-2", cat: "sports", icon: "⚽" },
  { name: "Penalty Kick Online", slug: "penalty-kick-online", cat: "sports", icon: "⚽" },
  { name: "Soccer Skills Euro Cup", slug: "soccer-skills-euro-cup", cat: "sports", icon: "🏆" },
  { name: "Soccer Skills World Cup", slug: "soccer-skills-world-cup", cat: "sports", icon: "🌍" },
  { name: "Soccer Skills Champions League", slug: "soccer-skills-champions-league", cat: "sports", icon: "🥇" },
  { name: "Football Masters", slug: "football-masters", cat: "sports", icon: "⚽" },
  { name: "Blumgi Soccer", slug: "blumgi-soccer", cat: "sports", icon: "⚽" },
  { name: "Rocket Soccer Derby", slug: "rocket-soccer-derby", cat: "sports", icon: "🚀" },
  { name: "Super Liquid Soccer", slug: "super-liquid-soccer", cat: "sports", icon: "💧" },
  { name: "Tennis Masters", slug: "tennis-masters", cat: "sports", icon: "🎾" },
  { name: "Retro Bowl", slug: "retro-bowl", cat: "sports", icon: "🏈" },
  { name: "Retro Bowl College", slug: "retro-bowl-college", cat: "sports", icon: "🏈" },
  { name: "4th of July Baseball", slug: "4th-of-july-baseball", cat: "sports", icon: "⚾" },
  { name: "3D Free Kick", slug: "3d-free-kick", cat: "sports", icon: "🦶" },
  { name: "2 Minute Football", slug: "2-minute-football", cat: "sports", icon: "🏈" },
  { name: "Sling World Cup", slug: "sling-world-cup", cat: "sports", icon: "🌍" },
  { name: "Sling Kong", slug: "sling-kong", cat: "sports", icon: "🦍" },
  { name: "Boxing Random", slug: "boxing-random", cat: "sports", icon: "🥊" },
  { name: "Rowdy City Wrestling", slug: "rowdy-city-wrestling", cat: "sports", icon: "🤼" },
  { name: "Tiny Fishing", slug: "tiny-fishing", cat: "sports", icon: "🎣" },
  { name: "Little Master Cricket", slug: "little-master-cricket", cat: "sports", icon: "🏏" },
  { name: "Blumgi Racers", slug: "blumgi-racers", cat: "racing", icon: "🏎️" },
  { name: "Blumgi Rocket", slug: "blumgi-rocket", cat: "sports", icon: "🚀" },
  { name: "GunSpin", slug: "gunspin", cat: "sports", icon: "🔫" },
  // Idle / Clicker
  { name: "Cookie Clicker", slug: "cookie-clicker", cat: "idle", icon: "🍪" },
  { name: "Planet Clicker", slug: "planet-clicker", cat: "idle", icon: "🪐" },
  { name: "Capybara Clicker Pro", slug: "capybara-clicker-pro", cat: "idle", icon: "🐾" },
  { name: "Idle Digging Tycoon", slug: "idle-digging-tycoon", cat: "idle", icon: "⛏️" },
  { name: "Idle Lumber Inc", slug: "idle-lumber-inc", cat: "idle", icon: "🪵" },
  { name: "GrindCraft", slug: "grindcraft", cat: "idle", icon: "⚒️" },
  { name: "Tube Clicker", slug: "tube-clicker", cat: "idle", icon: "📹" },
  { name: "Idle Gold Miner", slug: "idle-gold-miner", cat: "idle", icon: "⛏️" },
  { name: "Idle Cowshed", slug: "idle-cowshed", cat: "idle", icon: "🐄" },
  { name: "Digging Master", slug: "digging-master", cat: "idle", icon: "⛏️" },
  // Simulation
  { name: "Eaglercraft", slug: "eaglercraft", cat: "simulation", icon: "🌳" },
  { name: "Dragon Simulator 3D", slug: "dragon-simulator-3d", cat: "simulation", icon: "🐉" },
  { name: "Tiger Simulator 3D", slug: "tiger-simulator-3d", cat: "simulation", icon: "🐅" },
  { name: "Horse Simulator 3D", slug: "horse-simulator-3d", cat: "simulation", icon: "🐎" },
  { name: "Flying Car Simulator", slug: "flying-car-simulator", cat: "simulation", icon: "✈️" },
  { name: "Off-Road Rain Cargo Simulator", slug: "off-road-rain-cargo-simulator", cat: "simulation", icon: "🚛" },
  { name: "Just Park It 12", slug: "just-park-it-12", cat: "simulation", icon: "🅿️" },
  { name: "Raft Life", slug: "raft-life", cat: "simulation", icon: "🛟" },
  { name: "Papa's Taco Mia", slug: "papas-taco-mia", cat: "simulation", icon: "🌮" },
  { name: "Papa's Sushiria", slug: "papas-sushiria", cat: "simulation", icon: "🍣" },
  // Stickman
  { name: "Stickman Fighter: Epic Battle", slug: "stickman-fighter-epic-battle", cat: "stickman", icon: "⚔️" },
  { name: "Stickman Army: Team Battle", slug: "stickman-army-team-battle", cat: "stickman", icon: "🪖" },
  { name: "Stickman Crazy Box", slug: "stickman-crazy-box", cat: "stickman", icon: "📦" },
  { name: "Stickman Parkour Skyland", slug: "stickman-parkour-skyland", cat: "stickman", icon: "🏃" },
  { name: "Stickman Destruction", slug: "stickman-destruction", cat: "stickman", icon: "💥" },
  { name: "Stickman Archero Fight", slug: "stickman-archero-fight", cat: "stickman", icon: "🏹" },
  { name: "Count Masters: Stickman Games", slug: "count-masters-stickman-games", cat: "stickman", icon: "🔢" },
  { name: "Stick Duel Battle", slug: "stick-duel-battle", cat: "stickman", icon: "⚔️" },
  { name: "Stick Merge", slug: "stick-merge", cat: "stickman", icon: "🔗" },
  // IO
  { name: "Yohoho.io", slug: "yohoho-io", cat: "io", icon: "🏴‍☠️" },
  { name: "Snowball.io", slug: "snowball-io", cat: "io", icon: "⛄" },
  { name: "ArmedForces.io", slug: "armedforces-io", cat: "io", icon: "🎖️" },
  { name: "Hole.io", slug: "hole-io", cat: "io", icon: "🕳️" },
  { name: "Snake.is MLG", slug: "snake-is-mlg", cat: "io", icon: "🐍" },
  { name: "Tall.io", slug: "tall-io", cat: "io", icon: "📏" },
  { name: "SuperHero.io", slug: "superhero-io", cat: "io", icon: "🦸" },
  { name: "Tanko.io", slug: "tanko-io", cat: "io", icon: "🪖" },
  // Platformer
  { name: "OvO", slug: "ovo", cat: "platformer", icon: "🏃" },
  { name: "OvO Dimensions", slug: "ovo-dimensions", cat: "platformer", icon: "🔵" },
  { name: "Geometry Dash Lite", slug: "geometry-dash-lite", cat: "platformer", icon: "🔷" },
  { name: "Geometry Dash World", slug: "geometry-dash-world", cat: "platformer", icon: "🌍" },
  { name: "Geometry Dash", slug: "geometry-dash", cat: "platformer", icon: "💠" },
  { name: "Fancy Pants 3", slug: "fancy-pants-3", cat: "platformer", icon: "👖" },
  { name: "Run 3", slug: "run-3", cat: "platformer", icon: "🏃" },
  { name: "Tall Man Run", slug: "tall-man-run", cat: "platformer", icon: "🧍" },
  { name: "Dreadhead Parkour", slug: "dreadhead-parkour", cat: "platformer", icon: "🤸" },
  { name: "Hop Chop", slug: "hop-chop", cat: "platformer", icon: "🐸" },
  { name: "Poor Bunny", slug: "poor-bunny", cat: "platformer", icon: "🐰" },
  { name: "Dark Runner", slug: "dark-runner", cat: "platformer", icon: "🌑" },
  { name: "Tomb of the Mask", slug: "tomb-of-the-mask", cat: "platformer", icon: "🗿" },
  // Other
  { name: "BitLife", slug: "bitlife", cat: "other", icon: "📱" },
  { name: "Subway Surfers", slug: "subway-surfers", cat: "other", icon: "🚇" },
  { name: "FNaF 1", slug: "fnaf-1", cat: "other", icon: "🐻" },
  { name: "Blumgi Bloom", slug: "blumgi-bloom", cat: "other", icon: "🌸" },
  { name: "Blumgi Dragon", slug: "blumgi-dragon", cat: "other", icon: "🐉" },
  { name: "Blumgi Castle", slug: "blumgi-castle", cat: "other", icon: "🏰" },
  { name: "Blumgi Merge", slug: "blumgi-merge", cat: "other", icon: "🔮" },
  { name: "Noob Drive", slug: "noob-drive", cat: "other", icon: "🚗" },
  { name: "BuildNow GG", slug: "buildnow-gg", cat: "other", icon: "🏗️" },
  { name: "Jacksmith", slug: "jacksmith", cat: "other", icon: "⚒️" },
  { name: "Bob The Robber 4", slug: "bob-the-robber-4", cat: "other", icon: "🕵️" },
  { name: "Fireboy and Watergirl 1", slug: "fireboy-and-watergirl-1-forest-temple", cat: "other", icon: "🔥" },
  { name: "Hide and Smash", slug: "hide-and-smash", cat: "action", icon: "🫥" },
  { name: "Battle Wheels", slug: "battle-wheels", cat: "racing", icon: "💥" },
  { name: "Sharkosaurus Rampage", slug: "sharkosaurus-rampage", cat: "action", icon: "🦈" },
  { name: "Eggy Car", slug: "eggy-car", cat: "other", icon: "🥚" },
  { name: "Noob Miner", slug: "noob-miner-escape-from-prison", cat: "other", icon: "⛏️" },
  { name: "Dinosaurs Merge Master", slug: "dinosaurs-merge-master", cat: "other", icon: "🦕" },
  { name: "Pizza Ready", slug: "pizza-ready", cat: "other", icon: "🍕" },
  { name: "Short Ride", slug: "short-ride", cat: "other", icon: "🚴" },
  { name: "Stacktris", slug: "stacktris", cat: "puzzle", icon: "🟥" },
  { name: "Hover Racer Drive", slug: "hover-racer-drive", cat: "racing", icon: "🚁" },
  { name: "Jet Pack Joyride", slug: "jetpack-joyride", cat: "platformer", icon: "🚀" },
  { name: "Duck Life 4", slug: "duck-life-4", cat: "other", icon: "🦆" },
  { name: "Spiral Roll", slug: "spiral-roll", cat: "other", icon: "🌀" },
  { name: "Extreme Off Road Cars 3", slug: "extreme-off-road-cars-3-cargo", cat: "racing", icon: "🚙" },
  { name: "Seven Days in Purgatory", slug: "seven-days-in-purgatory", cat: "other", icon: "🌙" },
  { name: "Escaping the Prison", slug: "escaping-the-prison", cat: "other", icon: "🏛️" },
  { name: "Big Shot Boxing", slug: "big-shot-boxing", cat: "sports", icon: "🥊" },
  { name: "Papercraft Wars", slug: "papercraft-wars", cat: "action", icon: "📄" },
  { name: "Bearsus", slug: "bearsus", cat: "action", icon: "🐻" },
  { name: "Wall of Doom", slug: "wall-of-doom", cat: "action", icon: "🧱" },
  { name: "Challenge the Runners", slug: "challenge-the-runners", cat: "sports", icon: "🏃" },
  { name: "Supercars Royale", slug: "supercars-royale", cat: "racing", icon: "👑" },
  { name: "Crazy Karts", slug: "crazy-karts", cat: "racing", icon: "🏎️" },
  { name: "PolyTrack", slug: "polytrack", cat: "racing", icon: "🔺" },
  { name: "Tricks", slug: "tricks", cat: "other", icon: "🎪" },
  { name: "Monster Truck Racing Arena", slug: "monster-truck-racing-arena", cat: "racing", icon: "🚛" },
  { name: "3D Moto Simulator 2", slug: "3d-moto-simulator-2", cat: "racing", icon: "🏍️" },
  { name: "War Master", slug: "war-master", cat: "action", icon: "🪖" },
  { name: "Dual Cat", slug: "dual-cat", cat: "other", icon: "🐱" },
  { name: "Animal Arena", slug: "animal-arena", cat: "action", icon: "🐾" },
  { name: "Super Speeder", slug: "super-speeder", cat: "racing", icon: "⚡" },
  { name: "Clash of Skulls", slug: "clash-of-skulls", cat: "action", icon: "💀" },
  { name: "OvO Dimensions", slug: "ovo-dimensions", cat: "platformer", icon: "🔮" },
  { name: "Moto X3M Spooky Land", slug: "moto-x3m-spooky-land", cat: "racing", icon: "🎃" },
  { name: "Crazy Cattle 3D", slug: "crazy-cattle-3d", cat: "other", icon: "🐄" },
  { name: "Tiny Towers", slug: "tiny-towers", cat: "idle", icon: "🏢" },
  { name: "Rush Race Motocross", slug: "rush-race-motocross", cat: "racing", icon: "🏍️" },
  { name: "Gladiator True Story", slug: "gladiator-true-story", cat: "action", icon: "⚔️" },
  { name: "Eggbot Vs Zombies", slug: "eggbot-vs-zombies", cat: "action", icon: "🥚" },
  { name: "Noob Hook", slug: "noob-hook", cat: "platformer", icon: "🪝" },
  { name: "Burger Bounty", slug: "burger-bounty", cat: "other", icon: "🍔" },
  { name: "Shady Bears", slug: "shady-bears", cat: "other", icon: "🐻" },
  { name: "4th of July Baseball", slug: "4th-of-july-baseball", cat: "sports", icon: "🎆" },
  { name: "Snowball.io", slug: "snowball-io", cat: "io", icon: "⛄" },
  { name: "Blumgi Dragon", slug: "blumgi-dragon", cat: "other", icon: "🐲" },
  { name: "Eggbot Vs Zombies", slug: "eggbot-vs-zombies", cat: "action", icon: "🧟" },
];

// Deduplicate by slug
const seen = new Set();
const games = GAMES.filter(g => {
  if (seen.has(g.slug)) return false;
  seen.add(g.slug);
  return true;
});

let activeCategory = 'all';
let searchQuery = '';

function getUrl(slug) {
  return `https://gamesaturn.com/game/${slug}/`;
}

function getEmbedUrl(slug) {
  // Try to embed the game page directly
  return `https://gamesaturn.com/game/${slug}/`;
}

function filterCategory(cat, el) {
  activeCategory = cat;
  document.querySelectorAll('.category-btn').forEach(b => b.classList.remove('active'));
  el.classList.add('active');
  renderGames();
}

function handleSearch() {
  searchQuery = document.getElementById('searchInput').value.toLowerCase();
  renderGames();
}

function renderGames() {
  const grid = document.getElementById('gameGrid');
  let filtered = games.filter(g => {
    const matchCat = activeCategory === 'all' || g.cat === activeCategory;
    const matchSearch = !searchQuery || g.name.toLowerCase().includes(searchQuery);
    return matchCat && matchSearch;
  });

  document.getElementById('visibleCount').textContent = `${filtered.length} game${filtered.length !== 1 ? 's' : ''}`;

  if (filtered.length === 0) {
    grid.innerHTML = '<div class="empty">No games found 🙈</div>';
    return;
  }

  grid.innerHTML = filtered.map(g => `
    <div class="game-card" onclick="openGame('${g.slug}','${g.name.replace(/'/g,"\\'")}','${g.icon}')">
      <div class="play-overlay">▶</div>
      <div class="game-thumb">${g.icon}</div>
      <div class="game-info">
        <div class="game-name">${g.name}</div>
        <span class="game-tag">${g.cat}</span>
      </div>
    </div>
  `).join('');
}

function updateCounts() {
  const cats = ['action','racing','puzzle','sports','idle','simulation','stickman','shooter','io','platformer','other'];
  document.getElementById('count-all').textContent = games.length;
  cats.forEach(c => {
    const el = document.getElementById('count-' + c);
    if (el) el.textContent = games.filter(g => g.cat === c).length;
  });
}

function openGame(slug, name, icon) {
  const modal = document.getElementById('gameModal');
  const iframe = document.getElementById('gameIframe');
  const title = document.getElementById('modalTitle');
  const extLink = document.getElementById('openExternal');
  const blocked = document.getElementById('iframeBlocked');
  const blockedTitle = document.getElementById('blockedTitle');
  const blockedLink = document.getElementById('blockedLink');

  const url = getUrl(slug);
  title.innerHTML = `<span>${icon} ${name}</span>`;
  extLink.href = url;
  blockedLink.href = url;
  blockedTitle.textContent = name;

  iframe.src = url;
  blocked.classList.remove('show');
  modal.classList.add('open');

  // If iframe fails to load, show fallback
  iframe.onload = function() {
    try {
      // Check if page loaded by trying to access contentDocument
      const doc = iframe.contentDocument || iframe.contentWindow.document;
      if (!doc || doc.body === null) {
        showFallback();
      }
    } catch(e) {
      // Cross-origin block means it loaded but we can't inspect — that's fine!
    }
  };

  iframe.onerror = function() {
    showFallback();
  };

  // Timeout fallback
  setTimeout(() => {
    try {
      if (iframe.contentDocument && iframe.contentDocument.title === '') {
        showFallback();
      }
    } catch(e) { /* cross-origin, game probably loaded fine */ }
  }, 5000);
}

function showFallback() {
  document.getElementById('gameIframe').style.display = 'none';
  document.getElementById('iframeBlocked').classList.add('show');
}

function closeGame() {
  const modal = document.getElementById('gameModal');
  const iframe = document.getElementById('gameIframe');
  modal.classList.remove('open');
  iframe.src = '';
  iframe.style.display = 'block';
  document.getElementById('iframeBlocked').classList.remove('show');
}

// Close modal on backdrop click
document.getElementById('gameModal').addEventListener('click', function(e) {
  if (e.target === this) closeGame();
});

// ESC to close
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeGame(); });

// Init
updateCounts();
renderGames();
</script>
</body>
</html>
