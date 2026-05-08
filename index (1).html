<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Game Station</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
  <style>
    :root {
      --bg: #080810;
      --gap: 20px;
      --win-radius: 13px;
      --win-bg: #13131f;
      --titlebar: #0e0e1a;
      --titlebar-border: #22222e;
      --sidebar-bg: #0b0b16;
      --card: #1a1a28;
      --card-hover: #22223a;
      --accent: #5b5ef4;
      --accent-dim: rgba(91,94,244,0.15);
      --text: #ffffff;
      --text-sub: rgba(255,255,255,0.55);
      --text-dim: rgba(255,255,255,0.25);
      --close: #ff5f56;
      --minimize: #ffbd2e;
      --maximize: #27c93f;
      --border: rgba(255,255,255,0.06);
    }
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      background: var(--bg);
      font-family: 'DM Sans', system-ui, sans-serif;
      color: var(--text);
      height: 100vh;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    body::before {
      content: '';
      position: fixed;
      inset: 0;
      background:
        radial-gradient(ellipse 70% 50% at 15% 15%, rgba(91,94,244,0.10) 0%, transparent 60%),
        radial-gradient(ellipse 50% 60% at 85% 85%, rgba(91,94,244,0.06) 0%, transparent 60%);
      pointer-events: none;
      z-index: 0;
    }
    .desktop {
      position: relative;
      z-index: 1;
      width: calc(100vw - var(--gap) * 2);
      height: calc(100vh - var(--gap) * 2);
    }
    .mac-window {
      width: 100%;
      height: 100%;
      background: var(--win-bg);
      border-radius: var(--win-radius);
      box-shadow: 0 0 0 1px rgba(255,255,255,0.07), 0 40px 100px rgba(0,0,0,0.85);
      display: flex;
      flex-direction: column;
      overflow: hidden;
    }
    .titlebar {
      height: 48px;
      background: var(--titlebar);
      border-bottom: 1px solid var(--titlebar-border);
      display: flex;
      align-items: center;
      padding: 0 18px;
      gap: 14px;
      flex-shrink: 0;
      user-select: none;
    }
    .traffic { display: flex; gap: 7px; align-items: center; }
    .dot { width: 12px; height: 12px; border-radius: 50%; flex-shrink: 0; }
    .dot.c { background: var(--close); }
    .dot.m { background: var(--minimize); }
    .dot.x { background: var(--maximize); }
    .bar-title {
      flex: 1;
      text-align: center;
      font-size: 13px;
      font-weight: 600;
      color: var(--text-sub);
      margin-right: 62px;
      letter-spacing: 0.2px;
    }
    .body { display: flex; flex: 1; overflow: hidden; }
    .sidebar {
      width: 200px;
      background: var(--sidebar-bg);
      border-right: 1px solid var(--titlebar-border);
      display: flex;
      flex-direction: column;
      flex-shrink: 0;
      overflow-y: auto;
      padding: 10px 8px 16px;
    }
    .sidebar::-webkit-scrollbar { width: 3px; }
    .sidebar::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.07); border-radius: 2px; }
    .sidebar-section {
      font-size: 10px;
      font-weight: 700;
      letter-spacing: 1.2px;
      text-transform: uppercase;
      color: var(--text-dim);
      padding: 10px 10px 6px;
    }
    .cat-btn {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 8px 10px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 13px;
      font-weight: 500;
      color: var(--text-sub);
      transition: background 0.12s, color 0.12s;
      gap: 8px;
    }
    .cat-btn:hover { background: rgba(255,255,255,0.05); color: var(--text); }
    .cat-btn.active { background: var(--accent-dim); color: var(--text); }
    .cat-label { flex: 1; }
    .cat-count {
      font-size: 11px;
      font-weight: 600;
      color: var(--text-dim);
      background: rgba(255,255,255,0.06);
      padding: 1px 7px;
      border-radius: 20px;
    }
    .cat-btn.active .cat-count { color: var(--text-sub); }
    .main { flex: 1; display: flex; flex-direction: column; overflow: hidden; }
    .search-row {
      padding: 12px 16px;
      border-bottom: 1px solid var(--titlebar-border);
      display: flex;
      align-items: center;
      gap: 12px;
    }
    .search-wrap { flex: 1; position: relative; }
    .search-icon {
      position: absolute;
      left: 11px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--text-dim);
      font-size: 14px;
      pointer-events: none;
    }
    .search {
      width: 100%;
      background: rgba(255,255,255,0.05);
      border: 1px solid var(--border);
      border-radius: 9px;
      padding: 8px 12px 8px 34px;
      font-size: 13px;
      font-family: inherit;
      color: var(--text);
      outline: none;
      transition: border-color 0.15s;
    }
    .search:focus { border-color: rgba(91,94,244,0.4); }
    .search::placeholder { color: var(--text-dim); }
    .count-label { font-size: 12px; font-weight: 500; color: var(--text-dim); white-space: nowrap; }
    .grid-wrap { flex: 1; overflow-y: auto; padding: 14px 16px; }
    .grid-wrap::-webkit-scrollbar { width: 5px; }
    .grid-wrap::-webkit-scrollbar-thumb { background: rgba(255,255,255,0.08); border-radius: 3px; }
    .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); gap: 12px; }
    .card {
      background: var(--card);
      border: 1px solid var(--border);
      border-radius: 11px;
      cursor: pointer;
      overflow: hidden;
      position: relative;
      transition: transform 0.18s cubic-bezier(0.34,1.56,0.64,1), background 0.15s, border-color 0.15s, box-shadow 0.15s;
    }
    .card:hover {
      transform: translateY(-3px);
      background: var(--card-hover);
      border-color: rgba(91,94,244,0.35);
      box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    }
    .card-thumb {
      width: 100%;
      aspect-ratio: 4/3;
      background: linear-gradient(135deg, #181828 0%, #1e1e30 100%);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .thumb-text {
      font-size: 11px;
      font-weight: 600;
      color: var(--text-dim);
      text-align: center;
      padding: 6px;
      letter-spacing: 0.3px;
    }
    .card-info { padding: 9px 11px 11px; }
    .card-name { font-size: 12px; font-weight: 600; color: var(--text); line-height: 1.3; margin-bottom: 5px; }
    .card-tag {
      font-size: 10px;
      font-weight: 600;
      color: var(--text-dim);
      background: rgba(255,255,255,0.05);
      padding: 2px 7px;
      border-radius: 20px;
      display: inline-block;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }
    .play-overlay {
      position: absolute;
      inset: 0;
      background: rgba(91,94,244,0.82);
      display: flex;
      align-items: center;
      justify-content: center;
      opacity: 0;
      transition: opacity 0.15s;
    }
    .play-icon {
      width: 0; height: 0;
      border-style: solid;
      border-width: 14px 0 14px 24px;
      border-color: transparent transparent transparent #ffffff;
      margin-left: 4px;
    }
    .card:hover .play-overlay { opacity: 1; }
    .empty-state { grid-column: 1/-1; text-align: center; padding: 60px 20px; color: var(--text-dim); font-size: 14px; }

    /* ── Modal ── */
    .modal-bg {
      position: fixed;
      inset: 0;
      z-index: 200;
      background: rgba(0,0,0,0.75);
      backdrop-filter: blur(12px);
      display: none;
      align-items: center;
      justify-content: center;
    }
    .modal-bg.open { display: flex; }
    .game-win {
      width: calc(100vw - 60px);
      height: calc(100vh - 60px);
      background: #0a0a14;
      border-radius: var(--win-radius);
      box-shadow: 0 0 0 1px rgba(255,255,255,0.08), 0 50px 120px rgba(0,0,0,0.95);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      animation: pop 0.22s cubic-bezier(0.34,1.56,0.64,1);
    }
    @keyframes pop { from { transform: scale(0.88); opacity: 0; } to { transform: scale(1); opacity: 1; } }
    .game-bar {
      height: 46px;
      background: var(--titlebar);
      border-bottom: 1px solid var(--titlebar-border);
      display: flex;
      align-items: center;
      padding: 0 16px;
      gap: 12px;
      flex-shrink: 0;
    }
    .game-bar .bar-title { margin-right: 0; }
    .bar-btn {
      height: 30px;
      padding: 0 14px;
      border-radius: 7px;
      border: 1px solid var(--border);
      background: rgba(255,255,255,0.05);
      color: var(--text-sub);
      font-family: inherit;
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 6px;
      transition: background 0.12s, color 0.12s;
      white-space: nowrap;
    }
    .bar-btn:hover { background: rgba(255,255,255,0.10); color: var(--text); }
    .bar-btn.fs {
      background: var(--accent-dim);
      border-color: rgba(91,94,244,0.3);
      color: #a5a7ff;
    }
    .bar-btn.fs:hover { background: rgba(91,94,244,0.25); color: #ffffff; }
    .game-frame-wrap { flex: 1; position: relative; background: #000; }
    #gameFrame { width: 100%; height: 100%; border: none; display: block; }
    .blocked-screen {
      display: none;
      position: absolute;
      inset: 0;
      align-items: center;
      justify-content: center;
      flex-direction: column;
      gap: 18px;
      text-align: center;
      background: #0a0a14;
    }
    .blocked-screen.show { display: flex; }
    .blocked-screen h2 { font-size: 18px; font-weight: 700; color: var(--text); }
    .blocked-screen p { font-size: 13px; color: var(--text-sub); max-width: 320px; line-height: 1.6; }
    .blocked-link {
      display: inline-block;
      padding: 11px 28px;
      background: var(--accent);
      color: #fff;
      font-family: inherit;
      font-size: 13px;
      font-weight: 700;
      border-radius: 9px;
      text-decoration: none;
      transition: opacity 0.15s;
    }
    .blocked-link:hover { opacity: 0.85; }
  </style>
</head>
<body>

<div class="desktop">
  <div class="mac-window">
    <div class="titlebar">
      <div class="traffic">
        <div class="dot c"></div>
        <div class="dot m"></div>
        <div class="dot x"></div>
      </div>
      <div class="bar-title">Game Station</div>
    </div>
    <div class="body">
      <div class="sidebar">
        <div class="sidebar-section">Library</div>
        <div class="cat-btn active" data-cat="all"><span class="cat-label">All Games</span><span class="cat-count" id="c-all">0</span></div>
        <div class="cat-btn" data-cat="action"><span class="cat-label">Action</span><span class="cat-count" id="c-action">0</span></div>
        <div class="cat-btn" data-cat="racing"><span class="cat-label">Racing</span><span class="cat-count" id="c-racing">0</span></div>
        <div class="cat-btn" data-cat="puzzle"><span class="cat-label">Puzzle</span><span class="cat-count" id="c-puzzle">0</span></div>
        <div class="cat-btn" data-cat="sports"><span class="cat-label">Sports</span><span class="cat-count" id="c-sports">0</span></div>
        <div class="cat-btn" data-cat="shooter"><span class="cat-label">Shooter</span><span class="cat-count" id="c-shooter">0</span></div>
        <div class="cat-btn" data-cat="idle"><span class="cat-label">Idle / Clicker</span><span class="cat-count" id="c-idle">0</span></div>
        <div class="cat-btn" data-cat="simulation"><span class="cat-label">Simulation</span><span class="cat-count" id="c-simulation">0</span></div>
        <div class="cat-btn" data-cat="stickman"><span class="cat-label">Stickman</span><span class="cat-count" id="c-stickman">0</span></div>
        <div class="cat-btn" data-cat="io"><span class="cat-label">.io Games</span><span class="cat-count" id="c-io">0</span></div>
        <div class="cat-btn" data-cat="platformer"><span class="cat-label">Platformer</span><span class="cat-count" id="c-platformer">0</span></div>
        <div class="cat-btn" data-cat="other"><span class="cat-label">Other</span><span class="cat-count" id="c-other">0</span></div>
      </div>
      <div class="main">
        <div class="search-row">
          <div class="search-wrap">
            <span class="search-icon">&#x2315;</span>
            <input class="search" id="searchInput" type="text" placeholder="Search games..." oninput="doSearch()" />
          </div>
          <div class="count-label" id="countLabel">0 games</div>
        </div>
        <div class="grid-wrap">
          <div class="grid" id="grid"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="modal-bg" id="modal">
  <div class="game-win">
    <div class="game-bar">
      <div class="traffic">
        <div class="dot c" onclick="closeGame()" style="cursor:pointer"></div>
        <div class="dot m"></div>
        <div class="dot x"></div>
      </div>
      <div class="bar-title" id="modalTitle">Loading...</div>
      <button class="bar-btn" onclick="closeGame()">Back</button>
      <button class="bar-btn fs" onclick="fullscreenGame()">Fullscreen</button>
    </div>
    <div class="game-frame-wrap">
      <iframe id="gameFrame" allowfullscreen allow="fullscreen; autoplay; clipboard-write"></iframe>
      <div class="blocked-screen" id="blockedScreen">
        <h2 id="blockedTitle">Game</h2>
        <p>This game could not load in the embedded player. Click below to play it directly.</p>
        <a class="blocked-link" id="blockedLink" href="#" target="_blank">Play Now</a>
      </div>
    </div>
  </div>
</div>

<script>
const B = 'https://www.onlinegames.io/games';

const GAMES = [
  // RACING
  {name:'Moto X3M',cat:'racing',embed:`${B}/2024/gm/moto-x3m/index.html`,fb:'https://www.onlinegames.io/moto-x3m/'},
  {name:'Moto X3M Winter',cat:'racing',embed:`${B}/2024/gm/moto-x3m-winter/index.html`,fb:'https://www.onlinegames.io/moto-x3m-winter/'},
  {name:'Moto X3M Spooky Land',cat:'racing',embed:`${B}/2024/gm/moto-x3m-spooky-land/index.html`,fb:'https://www.onlinegames.io/moto-x3m-spooky-land/'},
  {name:'Moto X3M Pool Party',cat:'racing',embed:`${B}/2024/gm/moto-x3m-pool-party/index.html`,fb:'https://www.onlinegames.io/moto-x3m-pool-party/'},
  {name:'Drift Hunters',cat:'racing',embed:`${B}/2022/unity3d/drift-hunters/index.html`,fb:'https://www.onlinegames.io/drift-hunters/'},
  {name:'Drift Hunters Pro',cat:'racing',embed:`${B}/2023/unity/drift-hunters-pro/index.html`,fb:'https://www.onlinegames.io/drift-hunters-pro/'},
  {name:'Drift Hunters 2',cat:'racing',embed:`${B}/2024/unity/drift-hunters-2/index.html`,fb:'https://www.onlinegames.io/drift-hunters-2/'},
  {name:'Drift Boss',cat:'racing',embed:`${B}/2021/gm/drift-boss/index.html`,fb:'https://www.onlinegames.io/drift-boss/'},
  {name:'Madalin Stunt Cars 2',cat:'racing',embed:`${B}/2021/unity3d/madalin-stunt-cars-2/index.html`,fb:'https://www.onlinegames.io/madalin-stunt-cars-2/'},
  {name:'Snow Rider 3D',cat:'racing',embed:`${B}/2023/unity/snow-rider-3d/index.html`,fb:'https://www.onlinegames.io/snow-rider-3d/'},
  {name:'Traffic Jam 3D',cat:'racing',embed:`${B}/2022/unity3d/traffic-jam-3d/index.html`,fb:'https://www.onlinegames.io/traffic-jam-3d/'},
  {name:'Highway Racer 2',cat:'racing',embed:`${B}/2022/unity3d/highway-racer-2/index.html`,fb:'https://www.onlinegames.io/highway-racer-2/'},
  {name:'Drive Mad',cat:'racing',embed:`${B}/2022/gm/drive-mad/index.html`,fb:'https://www.onlinegames.io/drive-mad/'},
  {name:'Tunnel Rush',cat:'racing',embed:`${B}/2022/unity3d/tunnel-rush/index.html`,fb:'https://www.onlinegames.io/tunnel-rush/'},
  {name:'Super Tunnel Rush',cat:'racing',embed:`${B}/2023/unity/super-tunnel-rush/index.html`,fb:'https://www.onlinegames.io/super-tunnel-rush/'},
  {name:'Burnout Drift Hunter',cat:'racing',embed:`${B}/2024/unity/burnout-drift-hunter/index.html`,fb:'https://www.onlinegames.io/burnout-drift-hunter/'},
  {name:'Crazy Bikes',cat:'racing',embed:`${B}/2021/gm/crazy-bikes/index.html`,fb:'https://www.onlinegames.io/crazy-bikes/'},
  {name:'Crazy Cars',cat:'racing',embed:`${B}/2022/unity3d/crazy-cars/index.html`,fb:'https://www.onlinegames.io/crazy-cars/'},
  {name:'Demolition Derby',cat:'racing',embed:`${B}/2021/unity3d/demolition-derby-crash-racing/index.html`,fb:'https://www.onlinegames.io/demolition-derby-crash-racing/'},
  // ACTION
  {name:'Puppet Master',cat:'action',embed:`${B}/2022/gm/puppet-master/index.html`,fb:'https://www.onlinegames.io/puppet-master/'},
  {name:'Rio Rex',cat:'action',embed:`${B}/2021/gm/rio-rex/index.html`,fb:'https://www.onlinegames.io/rio-rex/'},
  {name:'Murder',cat:'action',embed:`${B}/2021/gm/murder/index.html`,fb:'https://www.onlinegames.io/murder/'},
  {name:'Wrestle Bros',cat:'action',embed:`${B}/2022/gm/wrestle-bros/index.html`,fb:'https://www.onlinegames.io/wrestle-bros/'},
  {name:'Dragon Ball Z Devolution',cat:'action',embed:`${B}/2021/gm/dragon-ball-z-devolution/index.html`,fb:'https://www.onlinegames.io/dragon-ball-z-devolution/'},
  {name:'Ragdoll Hit',cat:'action',embed:`${B}/2022/gm/ragdoll-hit/index.html`,fb:'https://www.onlinegames.io/ragdoll-hit/'},
  {name:'Gladihoppers',cat:'action',embed:`${B}/2021/gm/gladihoppers/index.html`,fb:'https://www.onlinegames.io/gladihoppers/'},
  {name:'Sausage Flip',cat:'action',embed:`${B}/2021/gm/sausage-flip/index.html`,fb:'https://www.onlinegames.io/sausage-flip/'},
  {name:'House of Hazards',cat:'action',embed:`${B}/2021/gm/house-of-hazards/index.html`,fb:'https://www.onlinegames.io/house-of-hazards/'},
  {name:'Burnin Rubber 5 XS',cat:'action',embed:`${B}/2021/gm/burnin-rubber-5-xs/index.html`,fb:'https://www.onlinegames.io/burnin-rubber-5-xs/'},
  {name:'Amazing Strange Rope Police',cat:'action',embed:`${B}/2021/unity3d/amazing-strange-rope-police/index.html`,fb:'https://www.onlinegames.io/amazing-strange-rope-police/'},
  {name:'Hide and Smash',cat:'action',embed:`${B}/2022/gm/hide-and-smash/index.html`,fb:'https://www.onlinegames.io/hide-and-smash/'},
  {name:'Sharkosaurus Rampage',cat:'action',embed:`${B}/2021/gm/sharkosaurus-rampage/index.html`,fb:'https://www.onlinegames.io/sharkosaurus-rampage/'},
  {name:'Stealing the Diamond',cat:'action',embed:`${B}/2021/gm/stealing-the-diamond/index.html`,fb:'https://www.onlinegames.io/stealing-the-diamond/'},
  {name:'Fleeing the Complex',cat:'action',embed:`${B}/2021/gm/fleeing-the-complex/index.html`,fb:'https://www.onlinegames.io/fleeing-the-complex/'},
  {name:'Breaking the Bank',cat:'action',embed:`${B}/2021/gm/breaking-the-bank/index.html`,fb:'https://www.onlinegames.io/breaking-the-bank/'},
  {name:'Gladiator True Story',cat:'action',embed:`${B}/2022/gm/gladiator-true-story/index.html`,fb:'https://www.onlinegames.io/gladiator-true-story/'},
  {name:'Papercraft Wars',cat:'action',embed:`${B}/2022/gm/papercraft-wars/index.html`,fb:'https://www.onlinegames.io/papercraft-wars/'},
  {name:'Bearsus',cat:'action',embed:`${B}/2023/gm/bearsus/index.html`,fb:'https://www.onlinegames.io/bearsus/'},
  {name:'Clash of Skulls',cat:'action',embed:`${B}/2021/gm/clash-of-skulls/index.html`,fb:'https://www.onlinegames.io/clash-of-skulls/'},
  {name:'Wall of Doom',cat:'action',embed:`${B}/2021/gm/wall-of-doom/index.html`,fb:'https://www.onlinegames.io/wall-of-doom/'},
  {name:'Animal Arena',cat:'action',embed:`${B}/2022/gm/animal-arena/index.html`,fb:'https://www.onlinegames.io/animal-arena/'},
  {name:'War of Caribbean Pirates',cat:'action',embed:`${B}/2021/gm/war-of-caribbean-pirates/index.html`,fb:'https://www.onlinegames.io/war-of-caribbean-pirates/'},
  // SHOOTER
  {name:'Time Shooter 2',cat:'shooter',embed:`${B}/2022/gm/time-shooter-2/index.html`,fb:'https://www.onlinegames.io/time-shooter-2/'},
  {name:'Time Shooter 3',cat:'shooter',embed:`${B}/2023/gm/time-shooter-3/index.html`,fb:'https://www.onlinegames.io/time-shooter-3/'},
  {name:'Rooftop Snipers 2',cat:'shooter',embed:`${B}/2022/gm/rooftop-snipers-2/index.html`,fb:'https://www.onlinegames.io/rooftop-snipers-2/'},
  {name:'Bullet Force',cat:'shooter',embed:`${B}/2022/unity3d/bullet-force/index.html`,fb:'https://www.onlinegames.io/bullet-force/'},
  {name:'SuperHot',cat:'shooter',embed:`${B}/2021/gm/superhot/index.html`,fb:'https://www.onlinegames.io/superhot/'},
  {name:'Funny Shooter 2',cat:'shooter',embed:`${B}/2022/gm/funny-shooter-2/index.html`,fb:'https://www.onlinegames.io/funny-shooter-2/'},
  {name:'Combat Online',cat:'shooter',embed:`${B}/2021/unity3d/combat-online/index.html`,fb:'https://www.onlinegames.io/combat-online/'},
  {name:'Pixel Shooter',cat:'shooter',embed:`${B}/2021/gm/pixel-shooter/index.html`,fb:'https://www.onlinegames.io/pixel-shooter/'},
  {name:'Paint Strike',cat:'shooter',embed:`${B}/2022/gm/paint-strike/index.html`,fb:'https://www.onlinegames.io/paint-strike/'},
  {name:'Sniper Shot Bullet Time',cat:'shooter',embed:`${B}/2022/unity3d/sniper-shot-bullet-time/index.html`,fb:'https://www.onlinegames.io/sniper-shot-bullet-time/'},
  {name:'BuildNow GG',cat:'shooter',embed:`${B}/2022/unity3d/buildnow-gg/index.html`,fb:'https://www.onlinegames.io/buildnow-gg/'},
  {name:'CS Online',cat:'shooter',embed:`${B}/2022/unity3d/cs-online/index.html`,fb:'https://www.onlinegames.io/cs-online/'},
  // PUZZLE
  {name:'Brain Test 2',cat:'puzzle',embed:`${B}/2021/gm/brain-test-2-tricky-stories/index.html`,fb:'https://www.onlinegames.io/brain-test-2-tricky-stories/'},
  {name:'Detective Loupe Puzzle',cat:'puzzle',embed:`${B}/2021/gm/detective-loupe-puzzle/index.html`,fb:'https://www.onlinegames.io/detective-loupe-puzzle/'},
  {name:'Gomu Goman',cat:'puzzle',embed:`${B}/2023/gm/gomu-goman/index.html`,fb:'https://www.onlinegames.io/gomu-goman/'},
  {name:'Funny Eye Surgery',cat:'puzzle',embed:`${B}/2021/gm/funny-eye-surgery/index.html`,fb:'https://www.onlinegames.io/funny-eye-surgery/'},
  {name:'Who Is?',cat:'puzzle',embed:`${B}/2021/gm/who-is/index.html`,fb:'https://www.onlinegames.io/who-is/'},
  {name:'Diggy',cat:'puzzle',embed:`${B}/2021/gm/diggy/index.html`,fb:'https://www.onlinegames.io/diggy/'},
  {name:'Draw Climber',cat:'puzzle',embed:`${B}/2021/gm/draw-climber/index.html`,fb:'https://www.onlinegames.io/draw-climber/'},
  {name:'Rescue the Fish',cat:'puzzle',embed:`${B}/2022/gm/rescue-the-fish/index.html`,fb:'https://www.onlinegames.io/rescue-the-fish/'},
  {name:'Spiral Roll',cat:'puzzle',embed:`${B}/2021/gm/spiral-roll/index.html`,fb:'https://www.onlinegames.io/spiral-roll/'},
  {name:'Stacktris',cat:'puzzle',embed:`${B}/2022/gm/stacktris/index.html`,fb:'https://www.onlinegames.io/stacktris/'},
  {name:'Idle Breakout',cat:'puzzle',embed:`${B}/2022/gm/idle-breakout/index.html`,fb:'https://www.onlinegames.io/idle-breakout/'},
  // SPORTS
  {name:'Penalty Shooters 2',cat:'sports',embed:`${B}/2022/gm/penalty-shooters-2/index.html`,fb:'https://www.onlinegames.io/penalty-shooters-2/'},
  {name:'Penalty Kick Online',cat:'sports',embed:`${B}/2022/gm/penalty-kick-online/index.html`,fb:'https://www.onlinegames.io/penalty-kick-online/'},
  {name:'Soccer Skills Euro Cup',cat:'sports',embed:`${B}/2021/gm/soccer-skills-euro-cup/index.html`,fb:'https://www.onlinegames.io/soccer-skills-euro-cup/'},
  {name:'Soccer Skills World Cup',cat:'sports',embed:`${B}/2022/gm/soccer-skills-world-cup/index.html`,fb:'https://www.onlinegames.io/soccer-skills-world-cup/'},
  {name:'Football Masters',cat:'sports',embed:`${B}/2022/gm/football-masters/index.html`,fb:'https://www.onlinegames.io/football-masters/'},
  {name:'Blumgi Soccer',cat:'sports',embed:`${B}/2022/gm/blumgi-soccer/index.html`,fb:'https://www.onlinegames.io/blumgi-soccer/'},
  {name:'Rocket Soccer Derby',cat:'sports',embed:`${B}/2022/gm/rocket-soccer-derby/index.html`,fb:'https://www.onlinegames.io/rocket-soccer-derby/'},
  {name:'Tennis Masters',cat:'sports',embed:`${B}/2022/gm/tennis-masters/index.html`,fb:'https://www.onlinegames.io/tennis-masters/'},
  {name:'Retro Bowl',cat:'sports',embed:`${B}/2021/gm/retro-bowl/index.html`,fb:'https://www.onlinegames.io/retro-bowl/'},
  {name:'3D Free Kick',cat:'sports',embed:`${B}/2021/unity3d/3d-free-kick/index.html`,fb:'https://www.onlinegames.io/3d-free-kick/'},
  {name:'Basketball Stars',cat:'sports',embed:`${B}/2022/gm/basketball-stars/index.html`,fb:'https://www.onlinegames.io/basketball-stars/'},
  {name:'Basketball Legends',cat:'sports',embed:`${B}/2021/gm/basketball-legends/index.html`,fb:'https://www.onlinegames.io/basketball-legends/'},
  {name:'Big Shot Boxing',cat:'sports',embed:`${B}/2021/gm/big-shot-boxing/index.html`,fb:'https://www.onlinegames.io/big-shot-boxing/'},
  {name:'Boxing Random',cat:'sports',embed:`${B}/2022/gm/boxing-random/index.html`,fb:'https://www.onlinegames.io/boxing-random/'},
  {name:'GunSpin',cat:'sports',embed:`${B}/2022/gm/gunspin/index.html`,fb:'https://www.onlinegames.io/gunspin/'},
  {name:'Tiny Fishing',cat:'sports',embed:`${B}/2022/gm/tiny-fishing/index.html`,fb:'https://www.onlinegames.io/tiny-fishing/'},
  // IDLE
  {name:'Cookie Clicker',cat:'idle',embed:`${B}/2022/gm/cookie-clicker/index.html`,fb:'https://www.onlinegames.io/cookie-clicker/'},
  {name:'Planet Clicker',cat:'idle',embed:`${B}/2022/gm/planet-clicker/index.html`,fb:'https://www.onlinegames.io/planet-clicker/'},
  {name:'Capybara Clicker Pro',cat:'idle',embed:`${B}/2023/gm/capybara-clicker-pro/index.html`,fb:'https://www.onlinegames.io/capybara-clicker-pro/'},
  {name:'Idle Digging Tycoon',cat:'idle',embed:`${B}/2022/gm/idle-digging-tycoon/index.html`,fb:'https://www.onlinegames.io/idle-digging-tycoon/'},
  {name:'Idle Lumber Inc',cat:'idle',embed:`${B}/2021/unity3d/idle-lumber-inc/index.html`,fb:'https://www.onlinegames.io/idle-lumber-inc/'},
  {name:'GrindCraft',cat:'idle',embed:`${B}/2021/gm/grindcraft/index.html`,fb:'https://www.onlinegames.io/grindcraft/'},
  {name:'Tube Clicker',cat:'idle',embed:`${B}/2021/gm/tube-clicker/index.html`,fb:'https://www.onlinegames.io/tube-clicker/'},
  {name:'Idle Ants',cat:'idle',embed:`${B}/2021/gm/idle-ants/index.html`,fb:'https://www.onlinegames.io/idle-ants/'},
  // SIMULATION
  {name:'Dragon Simulator 3D',cat:'simulation',embed:`${B}/2021/unity3d/dragon-simulator-3d/index.html`,fb:'https://www.onlinegames.io/dragon-simulator-3d/'},
  {name:'Tiger Simulator 3D',cat:'simulation',embed:`${B}/2021/unity3d/tiger-simulator-3d/index.html`,fb:'https://www.onlinegames.io/tiger-simulator-3d/'},
  {name:'Fox Simulator 3D',cat:'simulation',embed:`${B}/2022/unity3d/fox-simulator-3d/index.html`,fb:'https://www.onlinegames.io/fox-simulator-3d/'},
  {name:'Flying Car Simulator',cat:'simulation',embed:`${B}/2021/unity3d/flying-car-simulator/index.html`,fb:'https://www.onlinegames.io/flying-car-simulator/'},
  {name:"Papa's Taco Mia",cat:'simulation',embed:`${B}/2021/gm/papas-taco-mia/index.html`,fb:'https://www.onlinegames.io/papas-taco-mia/'},
  {name:"Papa's Sushiria",cat:'simulation',embed:`${B}/2022/gm/papas-sushiria/index.html`,fb:'https://www.onlinegames.io/papas-sushiria/'},
  {name:'Raft Life',cat:'simulation',embed:`${B}/2022/unity3d/raft-life/index.html`,fb:'https://www.onlinegames.io/raft-life/'},
  {name:'Real Flight Simulator',cat:'simulation',embed:`${B}/2022/unity3d/real-flight-simulator/index.html`,fb:'https://www.onlinegames.io/real-flight-simulator/'},
  {name:'GTA Simulator',cat:'simulation',embed:`${B}/2022/unity3d/gta-simulator/index.html`,fb:'https://www.onlinegames.io/gta-simulator/'},
  {name:'Life Simulator',cat:'simulation',embed:`${B}/2022/gm/life-simulator/index.html`,fb:'https://www.onlinegames.io/life-simulator/'},
  // STICKMAN
  {name:'Stickman Fighter Epic Battle',cat:'stickman',embed:`${B}/2021/gm/stickman-fighter-epic-battle/index.html`,fb:'https://www.onlinegames.io/stickman-fighter-epic-battle/'},
  {name:'Stickman Army Team Battle',cat:'stickman',embed:`${B}/2022/gm/stickman-army-team-battle/index.html`,fb:'https://www.onlinegames.io/stickman-army-team-battle/'},
  {name:'Stickman Parkour',cat:'stickman',embed:`${B}/2022/gm/stickman-parkour/index.html`,fb:'https://www.onlinegames.io/stickman-parkour/'},
  {name:'Stickman Destruction',cat:'stickman',embed:`${B}/2021/gm/stickman-destruction/index.html`,fb:'https://www.onlinegames.io/stickman-destruction/'},
  {name:'Count Masters',cat:'stickman',embed:`${B}/2022/gm/count-masters/index.html`,fb:'https://www.onlinegames.io/count-masters/'},
  {name:'Stick Duel Battle',cat:'stickman',embed:`${B}/2022/gm/stick-duel-battle/index.html`,fb:'https://www.onlinegames.io/stick-duel-battle/'},
  {name:'Stick Merge',cat:'stickman',embed:`${B}/2021/gm/stick-merge/index.html`,fb:'https://www.onlinegames.io/stick-merge/'},
  {name:'Stickman Kombat 2D',cat:'stickman',embed:`${B}/2022/gm/stickman-kombat-2d/index.html`,fb:'https://www.onlinegames.io/stickman-kombat-2d/'},
  {name:'Stickman Dragon Fight',cat:'stickman',embed:`${B}/2021/gm/stickman-dragon-fight/index.html`,fb:'https://www.onlinegames.io/stickman-dragon-fight/'},
  // IO
  {name:'Yohoho.io',cat:'io',embed:`${B}/2022/gm/yohoho-io/index.html`,fb:'https://www.onlinegames.io/yohoho-io/'},
  {name:'Snowball.io',cat:'io',embed:`${B}/2022/gm/snowball-io/index.html`,fb:'https://www.onlinegames.io/snowball-io/'},
  {name:'Hole.io',cat:'io',embed:`${B}/2021/unity3d/hole-io/index.html`,fb:'https://www.onlinegames.io/hole-io/'},
  {name:'Smash Karts',cat:'io',embed:`${B}/2022/unity3d/smash-karts/index.html`,fb:'https://www.onlinegames.io/smash-karts/'},
  {name:'Paper.io 2',cat:'io',embed:`${B}/2022/gm/paper-io-2/index.html`,fb:'https://www.onlinegames.io/paper-io-2/'},
  {name:'Bloxd.io',cat:'io',embed:`${B}/2022/unity3d/bloxd-io/index.html`,fb:'https://www.onlinegames.io/bloxd-io/'},
  {name:'Snaker.io',cat:'io',embed:`${B}/2023/gm/snaker-io/index.html`,fb:'https://www.onlinegames.io/snaker-io/'},
  // PLATFORMER
  {name:'OvO',cat:'platformer',embed:`${B}/2022/gm/ovo/index.html`,fb:'https://www.onlinegames.io/ovo/'},
  {name:'Geometry Dash Lite',cat:'platformer',embed:`${B}/2022/gm/geometry-dash-lite/index.html`,fb:'https://www.onlinegames.io/geometry-dash-lite/'},
  {name:'Geometry Dash',cat:'platformer',embed:`${B}/2022/gm/geometry-dash/index.html`,fb:'https://www.onlinegames.io/geometry-dash/'},
  {name:'Fancy Pants 3',cat:'platformer',embed:`${B}/2021/gm/fancy-pants-3/index.html`,fb:'https://www.onlinegames.io/fancy-pants-3/'},
  {name:'Run 3',cat:'platformer',embed:`${B}/2021/gm/run-3/index.html`,fb:'https://www.onlinegames.io/run-3/'},
  {name:'Tall Man Run',cat:'platformer',embed:`${B}/2022/gm/tall-man-run/index.html`,fb:'https://www.onlinegames.io/tall-man-run/'},
  {name:'Dreadhead Parkour',cat:'platformer',embed:`${B}/2022/gm/dreadhead-parkour/index.html`,fb:'https://www.onlinegames.io/dreadhead-parkour/'},
  {name:'Hop Chop',cat:'platformer',embed:`${B}/2022/gm/hop-chop/index.html`,fb:'https://www.onlinegames.io/hop-chop/'},
  {name:'Poor Bunny',cat:'platformer',embed:`${B}/2022/gm/poor-bunny/index.html`,fb:'https://www.onlinegames.io/poor-bunny/'},
  {name:'Tomb of the Mask',cat:'platformer',embed:`${B}/2021/gm/tomb-of-the-mask/index.html`,fb:'https://www.onlinegames.io/tomb-of-the-mask/'},
  {name:'Noob Hook',cat:'platformer',embed:`${B}/2023/gm/noob-hook/index.html`,fb:'https://www.onlinegames.io/noob-hook/'},
  {name:'Jump Dash',cat:'platformer',embed:`${B}/2023/gm/jump-dash/index.html`,fb:'https://www.onlinegames.io/jump-dash/'},
  // OTHER
  {name:'BitLife',cat:'other',embed:`${B}/2021/gm/bitlife/index.html`,fb:'https://www.onlinegames.io/bitlife/'},
  {name:'FNaF 1',cat:'other',embed:`${B}/2021/gm/five-nights-at-freddys/index.html`,fb:'https://www.onlinegames.io/five-nights-at-freddys/'},
  {name:'Eggy Car',cat:'other',embed:`${B}/2022/gm/eggy-car/index.html`,fb:'https://www.onlinegames.io/eggy-car/'},
  {name:'Fireboy and Watergirl',cat:'other',embed:`${B}/2021/gm/fireboy-and-watergirl/index.html`,fb:'https://www.onlinegames.io/fireboy-and-watergirl/'},
  {name:'Blumgi Castle',cat:'other',embed:`${B}/2022/gm/blumgi-castle/index.html`,fb:'https://www.onlinegames.io/blumgi-castle/'},
  {name:'Blumgi Dragon',cat:'other',embed:`${B}/2022/gm/blumgi-dragon/index.html`,fb:'https://www.onlinegames.io/blumgi-dragon/'},
  {name:'Blumgi Rocket',cat:'other',embed:`${B}/2022/gm/blumgi-rocket/index.html`,fb:'https://www.onlinegames.io/blumgi-rocket/'},
  {name:'Duck Life 4',cat:'other',embed:`${B}/2021/gm/duck-life-4/index.html`,fb:'https://www.onlinegames.io/duck-life-4/'},
  {name:'Jacksmith',cat:'other',embed:`${B}/2021/gm/jacksmith/index.html`,fb:'https://www.onlinegames.io/jacksmith/'},
  {name:'Bob The Robber 4',cat:'other',embed:`${B}/2021/gm/bob-the-robber-4/index.html`,fb:'https://www.onlinegames.io/bob-the-robber-4/'},
  {name:'Short Ride',cat:'other',embed:`${B}/2021/gm/short-ride/index.html`,fb:'https://www.onlinegames.io/short-ride/'},
  {name:'Pizza Ready',cat:'other',embed:`${B}/2022/gm/pizza-ready/index.html`,fb:'https://www.onlinegames.io/pizza-ready/'},
  {name:'Crazy Cattle 3D',cat:'other',embed:`${B}/2025/gm/crazy-cattle-3d/index.html`,fb:'https://www.onlinegames.io/crazy-cattle-3d/'},
  {name:'Burger Bounty',cat:'other',embed:`${B}/2022/gm/burger-bounty/index.html`,fb:'https://www.onlinegames.io/burger-bounty/'},
  {name:'Dual Cat',cat:'other',embed:`${B}/2022/gm/dual-cat/index.html`,fb:'https://www.onlinegames.io/dual-cat/'},
  {name:'Escaping the Prison',cat:'other',embed:`${B}/2021/gm/escaping-the-prison/index.html`,fb:'https://www.onlinegames.io/escaping-the-prison/'},
  {name:'Noob Drive',cat:'other',embed:`${B}/2022/gm/noob-drive/index.html`,fb:'https://www.onlinegames.io/noob-drive/'},
  {name:'Sandbox Destroy Ragdoll',cat:'other',embed:`${B}/2024/unity/sandbox-destroy-the-ragdoll/index.html`,fb:'https://www.onlinegames.io/sandbox-destroy-the-ragdoll/'},
  {name:'Dig out of Prison',cat:'other',embed:`${B}/2022/gm/dig-out-of-prison/index.html`,fb:'https://www.onlinegames.io/dig-out-of-prison/'},
  {name:'Obby Parkour Racing',cat:'platformer',embed:`${B}/2023/unity/obby-parkour-racing/index.html`,fb:'https://www.onlinegames.io/obby-parkour-racing/'},
];

const CATS = ['action','racing','puzzle','sports','shooter','idle','simulation','stickman','io','platformer','other'];
let activeCat = 'all', query = '';

document.querySelectorAll('.cat-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    document.querySelectorAll('.cat-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    activeCat = btn.dataset.cat;
    render();
  });
});

function doSearch() { query = document.getElementById('searchInput').value.toLowerCase(); render(); }

function getFiltered() {
  return GAMES.filter(g => (activeCat === 'all' || g.cat === activeCat) && (!query || g.name.toLowerCase().includes(query)));
}

function render() {
  const list = getFiltered();
  document.getElementById('countLabel').textContent = `${list.length} game${list.length !== 1 ? 's' : ''}`;
  const grid = document.getElementById('grid');
  if (!list.length) { grid.innerHTML = '<div class="empty-state">No games found</div>'; return; }
  grid.innerHTML = list.map(g => `
    <div class="card" data-embed="${g.embed}" data-fb="${g.fb}" data-name="${g.name.replace(/"/g,'&quot;')}">
      <div class="play-overlay"><div class="play-icon"></div></div>
      <div class="card-thumb"><div class="thumb-text">${g.name}</div></div>
      <div class="card-info">
        <div class="card-name">${g.name}</div>
        <span class="card-tag">${g.cat}</span>
      </div>
    </div>
  `).join('');
  grid.querySelectorAll('.card').forEach(c => {
    c.addEventListener('click', () => openGame(c.dataset.name, c.dataset.embed, c.dataset.fb));
  });
}

function updateCounts() {
  document.getElementById('c-all').textContent = GAMES.length;
  CATS.forEach(c => { const el = document.getElementById('c-' + c); if (el) el.textContent = GAMES.filter(g => g.cat === c).length; });
}

function openGame(name, embed, fb) {
  document.getElementById('modalTitle').textContent = name;
  document.getElementById('blockedTitle').textContent = name;
  document.getElementById('blockedLink').href = fb;
  document.getElementById('blockedScreen').classList.remove('show');
  const frame = document.getElementById('gameFrame');
  frame.style.display = 'block';
  frame.src = embed;
  document.getElementById('modal').classList.add('open');
}

function closeGame() {
  document.getElementById('modal').classList.remove('open');
  document.getElementById('gameFrame').src = 'about:blank';
  document.getElementById('blockedScreen').classList.remove('show');
}

function fullscreenGame() {
  const f = document.getElementById('gameFrame');
  (f.requestFullscreen || f.webkitRequestFullscreen || f.mozRequestFullScreen || f.msRequestFullscreen || (()=>{})).call(f);
}

document.getElementById('modal').addEventListener('click', e => { if (e.target.id === 'modal') closeGame(); });
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeGame(); });

updateCounts();
render();
</script>
</body>
</html>
