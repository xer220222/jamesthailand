
// backend/routes/houses.js
// 房屋相關 API 路由
const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// 建立 MySQL 連線池（請依你的資料庫設定調整）
const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '12345678',
  database: process.env.DB_NAME || 'house',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  charset: 'utf8mb4' ,
});


// 取得所有房屋（支援查詢參數：city, house_type, sort）
router.get('/', (req, res) => {
  // 這裡用 projects 表，請依你的實際表名調整
  let sql = 'SELECT * FROM projects';
  const params = [];
  const where = [];

  // 支援依城市與房型查詢
  if (req.query.city) {
    where.push('city = ?');
    params.push(req.query.city);
  }
  if (req.query.house_type) {
    where.push('house_type = ?');
    params.push(req.query.house_type);
  }
  if (req.query.name) {
  where.push('name = ?');
  params.push(req.query.name);
}
  // 組合 WHERE 條件
  if (where.length) sql += ' WHERE ' + where.join(' AND ');

  // 排序：價格或完工年份
  if (req.query.sort === 'price_asc') sql += ' ORDER BY price ASC';
  else if (req.query.sort === 'price_desc') sql += ' ORDER BY price DESC';
  else sql += ' ORDER BY completion_year DESC';

  // 執行查詢
  pool.query(sql, params, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
});

// 取得單一房屋（依 name查詢）
router.get('/:name', (req, res) => {
  // 這裡用 project_name，請依你的主鍵欄位調整
  pool.query('SELECT * FROM projects WHERE name = ?', [req.params.name], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (!results.length) return res.status(404).json({ error: '房屋不存在' });
    res.json(results[0]);
  });
});


// 匯出路由，讓 server.js 可以註冊
module.exports = router;
