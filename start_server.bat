@echo off
title Laser Vision Cable - Local Bill Server
echo ===================================================
echo   Laser Vision Cable - Local Server Launcher
echo ===================================================
echo.
echo Starting local web server on http://localhost:3000 ...
echo (Running on http://localhost enables 1-click automatic PDF file downloads!)
echo.

start "" "http://localhost:3000"

node -e "const http = require('http'); const fs = require('fs'); const path = require('path'); const server = http.createServer((req, res) => { let reqPath = decodeURI(req.url.split('?')[0]); if (reqPath === '/') reqPath = '/index.html'; const filePath = path.join(__dirname, reqPath); if (!fs.existsSync(filePath)) { res.writeHead(404, {'Content-Type': 'text/plain'}); return res.end('404 Not Found'); } const ext = path.extname(filePath).toLowerCase(); const mime = ext === '.png' ? 'image/png' : ext === '.jpg' || ext === '.jpeg' ? 'image/jpeg' : ext === '.js' ? 'application/javascript' : ext === '.css' ? 'text/css' : ext === '.svg' ? 'image/svg+xml' : 'text/html; charset=utf-8'; res.writeHead(200, { 'Content-Type': mime }); fs.createReadStream(filePath).pipe(res); }); server.listen(3000, () => { console.log('Bill Generator is live at http://localhost:3000'); console.log('Press Ctrl+C to stop server.'); });"
pause
