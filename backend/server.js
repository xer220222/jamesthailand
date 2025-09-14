// backend/server.js
const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// 解析 JSON
app.use(express.json());

// 預設首頁
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/main.html'));
}
);

// 前端靜態檔案 (main.html, house.html,index.html)
app.use(express.static(path.join(__dirname, '../frontend')));

// API 路由
app.use('/api/houses', require('./routes/houses'));
app.use('/uploads', express.static('uploads'));


// 啟動伺服器
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

// 啟用 CORS
const cors = require('cors');
app.use(cors());
