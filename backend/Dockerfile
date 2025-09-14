# 使用 Node.js 官方 LTS 版本
FROM node:18

# 建立工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝依賴
RUN npm install

# 複製專案程式碼
COPY . .

# 開放 3000 port
EXPOSE 3000

# 啟動伺服器
CMD ["node", "server.js"]
